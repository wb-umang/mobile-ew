import 'package:every_watch/backend/schema/structs/index.dart';
import 'package:every_watch/backend/schema/structs/watch_analysis_response_struct.dart';
import 'package:every_watch/backend/schema/structs/watch_price_analysis_filter_struct.dart';
import 'package:every_watch/backend/schema/structs/watch_price_analysis_response_struct.dart';
import 'package:every_watch/pages/watch_page/chart_filter_button.dart';
import 'package:high_chart/high_chart.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/auction_price_card/auction_price_card_widget.dart';
import '/components/pill_bold_button/pill_bold_button_widget.dart';
import '/components/price_guide_card/price_guide_card_widget.dart';
import '/components/specifications_card/specifications_card_widget.dart';
import '/components/two_button_page_menu/two_button_page_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'watch_page_model.dart';
export 'watch_page_model.dart';

class WatchPageWidget extends StatefulWidget {
  const WatchPageWidget({super.key});

  @override
  State<WatchPageWidget> createState() => _WatchPageWidgetState();
}

class _WatchPageWidgetState extends State<WatchPageWidget> {
  late WatchPageModel _model;
  late WatchListingStruct _watch;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  int _selectedButtonIndex = 0;
  late String _chartData;
  bool _isChartLoading = false;
  bool _isInitialLoading = true;
  WatchPriceAnalysisResponseStruct? _priceAnalysis;

  String _generateDealersChartData(
      List<DealerPriceAnalysisStruct> priceAnalysis,
      String scatterChartData,
      String unsoldScatterChartData) {
    // Create a map to store unique date entries with their latest values
    final Map<String, double> uniqueDateValues = {};

    // Filter non-zero values and get unique entries for each date
    for (var data in priceAnalysis) {
      if (data.medians.medianUsd != 0) {
        final parsedDate = DateTime.parse(data.timeRange);
        final dateKey = DateTime.utc(parsedDate.year, parsedDate.month,
                parsedDate.day, 0, 0, 0, 0, 0)
            .toIso8601String()
            .split('T')[0];

        uniqueDateValues[dateKey] = data.medians.medianUsd;
      }
    }

    // If no non-zero values found, return empty chart with message
    if (uniqueDateValues.isEmpty) {
      return '''{
        chart: {
          backgroundColor: '#faf8f6',
          spacingLeft: -30,
          spacingRight: 20,
          spacingTop: 50,
          spacingBottom: 5,
          height: 400,
          borderRadius: 12,
          type: 'scatter',
          events: {
            load: function() {
              const chart = this;
              chart.renderer.text('No data available for selected time period', 
                chart.plotWidth / 2 + chart.plotLeft, 
                chart.plotHeight / 2 + chart.plotTop)
                .css({
                  color: '#666666',
                  fontSize: '14px'
                })
                .attr({
                  align: 'center'
                })
                .add();
            }
          }
        },
        series: [{
          data: []
        }]
      }''';
    }

    // Convert the map entries to sorted list
    final sortedEntries = uniqueDateValues.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    // Calculate x-axis values
    final dates = sortedEntries.map((e) => DateTime.parse(e.key)).toList();
    final startDate = dates.first;
    final endDate = dates.last; // Use last data point instead of current date
    final totalDuration = endDate.difference(startDate).inMilliseconds;
    // Calculate y-axis max value
    final maxPrice = uniqueDateValues.values.reduce((a, b) => a > b ? a : b);
    final yAxisMax = (maxPrice * 1.8).round();

    // Generate series data from unique entries
    final seriesData = sortedEntries.map((entry) {
      final parsedDate = DateTime.parse(entry.key);
      final date = DateTime.utc(
          parsedDate.year, parsedDate.month, parsedDate.day, 0, 0, 0, 0, 0);
      return '''{
        x: ${date.millisecondsSinceEpoch},
        y: ${entry.value}
      }''';
    }).join(',\n');

    return '''{
      chart: {
          backgroundColor: '#faf8f6',
          spacingLeft: -30,
          spacingRight: 20,
          spacingTop: 50,
          spacingBottom: 5,
          height: 400,
          borderRadius: 12,
          type: 'scatter',
          zooming: {
              pinchType: 'xy',
              type: 'xy'
          },
          loading: {
              hideDuration: 0,
              showDuration: 0,
              labelStyle: {
                  display: 'none'
              }
          },
          events: {
            load: function () {
                const chart = this;
                const x = chart.plotLeft + chart.plotWidth / 2; // Center X
                const y = chart.plotTop + chart.plotHeight / 2; // Center Y
                chart.renderer
                    .text('E V E R Y W A T C H', x, y)
                    .css({
                        color: '#DFDEE0',
                        fontSize: '24px',
                        fontWeight: 'bold',
                        textAlign: 'center'
                    })
                    .attr({
                        zIndex: -1,
                        align: 'center'
                    })
                    .add();
          }
        }
      },
      credits: {
        enabled: false
      },
      title: {
          text: ''
      },
      xAxis: {
          type: 'datetime',
          dateTimeLabelFormats: {
              millisecond: '%b %Y',
              second: '%b %Y',
              minute: '%b %Y',
              hour: '%b %Y',
              week: '%e %b %Y',
              day: '%b %Y',
              month: '%b %Y',
              year: '%Y'
          },
          labels: {
              style: {
                  color: '#001633'
              }
          },
          lineColor: '#999999',
          tickColor: '#999999',
          tickAmount: 3,
          startOnTick: false,
          endOnTick: false,
          min: ${startDate.millisecondsSinceEpoch},
          max: ${endDate.millisecondsSinceEpoch},
          tickPositions: [
            ${startDate.millisecondsSinceEpoch},
            ${startDate.millisecondsSinceEpoch + totalDuration ~/ 2},
            ${endDate.millisecondsSinceEpoch}
          ]
      },
      yAxis: {
          min: 0,
          max: $yAxisMax,
          minPadding: 0.1,
          maxPadding: 0,
          softThreshold: false,
          title: {
              text: 'Price',
              align: 'high',
              verticalAlign: 'top',
              x: 40,
              y: -20,
              rotation: 0,
              style: {
                  color: '#001633'
              }
          },
          lineColor: '#999999',
          tickColor: '#999999',
          alignTicks: false,
          endOnTick: true,
          showLastLabel: true,
      },
      legend: {
          enabled: true
      },
      tooltip: {
          followPointer: false,
          followTouchMove: false,
          useHTML: true,
          borderRadius: 12,
          padding: 10,
          style: {
              pointerEvents: 'auto'
          },
          hideDelay: 800,
          stickOnContact: true,
      },
      series: [
      $scatterChartData,
      $unsoldScatterChartData,
      {
          data: [$seriesData],
          name: 'Dealer median',
          type: 'spline',
          dashStyle: 'Solid',
          color: '#5F9EA0',
          lineWidth: 3,
          marker: {
              enabled: false
          },
          stickyTracking: false,
      }
      ]
    }''';
  }

  String _getDateRange(int selectedButton) {
    final now = DateTime.now();
    late DateTime startDate;

    switch (selectedButton) {
      case 0: // 3 months
        startDate = DateTime(now.year, now.month - 3, now.day);
        break;
      case 1: // 6 months
        startDate = DateTime(now.year, now.month - 6, now.day);
        break;
      case 2: // 1 year
        startDate = DateTime(now.year - 1, now.month, now.day);
        break;
      case 3: // 2 years
        startDate = DateTime(now.year - 2, now.month, now.day);
        break;
      case 4: // 5 years
        startDate = DateTime(now.year - 5, now.month, now.day);
        break;
      default: // Max
        return "_${now.day.toString().padLeft(2, '0')}-"
            "${now.month.toString().padLeft(2, '0')}-"
            "${now.year}"; // Return current date with underscore
    }

    // Adjust the startDate to ensure the day is valid for the month
    if (startDate.day > DateTime(startDate.year, startDate.month + 1, 0).day) {
      startDate = DateTime(
          startDate.year, startDate.month + 1, 0); // Last day of the month
    }

    return "${startDate.day.toString().padLeft(2, '0')}-"
        "${startDate.month.toString().padLeft(2, '0')}-"
        "${startDate.year}_"
        "${now.day.toString().padLeft(2, '0')}-"
        "${now.month.toString().padLeft(2, '0')}-"
        "${now.year}";
  }

  String _generateAuctionChartData(
      List<AuctionAnalysisMedianStruct> auctionAnalysis,
      String scatterChartData,
      String unsoldScatterChartData) {
    // Create a map to store unique date entries with their latest values
    final Map<String, double> uniqueDateValues = {};

    // Filter non-zero values and get unique entries for each date
    for (var data in auctionAnalysis) {
      if (data.medians.medianUsd != 0) {
        final parsedDate = DateTime.parse(data.timeRange);
        final dateKey = DateTime.utc(parsedDate.year, parsedDate.month,
                parsedDate.day, 0, 0, 0, 0, 0)
            .toIso8601String()
            .split('T')[0];

        uniqueDateValues[dateKey] = data.medians.medianUsd;
      }
    }

    // If no non-zero values found, return empty chart with message
    if (uniqueDateValues.isEmpty) {
      return '''{
        chart: {
          backgroundColor: '#faf8f6',
          spacingLeft: -30,
          spacingRight: 20,
          spacingTop: 50,
          spacingBottom: 5,
          height: 400,
          borderRadius: 12,
          type: 'scatter',
          events: {
            load: function() {
              const chart = this;
              chart.renderer.text('No data available for selected time period', 
                chart.plotWidth / 2 + chart.plotLeft, 
                chart.plotHeight / 2 + chart.plotTop)
                .css({
                  color: '#666666',
                  fontSize: '14px'
                })
                .attr({
                  align: 'center'
                })
                .add();
            }
          }
        },
        series: [{
          data: []
        }]
      }''';
    }

    // Convert the map entries to sorted list
    final sortedEntries = uniqueDateValues.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    // Calculate x-axis values
    final dates = sortedEntries.map((e) => DateTime.parse(e.key)).toList();
    final startDate = dates.first;
    final endDate = dates.last; // Use last data point instead of current date
    final totalDuration = endDate.difference(startDate).inMilliseconds;

    // Calculate y-axis max value
    final maxPrice = uniqueDateValues.values.reduce((a, b) => a > b ? a : b);
    final yAxisMax = (maxPrice * 1.8).round();

    // Generate series data from unique entries
    final seriesData = sortedEntries.map((entry) {
      final parsedDate = DateTime.parse(entry.key);
      final date = DateTime.utc(
          parsedDate.year, parsedDate.month, parsedDate.day, 0, 0, 0, 0, 0);
      return '''{
        x: ${date.millisecondsSinceEpoch},
        y: ${entry.value}
      }''';
    }).join(',\n');

    return '''{
      chart: {
        backgroundColor: '#faf8f6',
        spacingLeft: -30,
        spacingRight: 20,
        spacingTop: 50,
        spacingBottom: 5,
        height: 400,
        borderRadius: 12,
        type: 'scatter',
        zooming: {
          pinchType: 'xy',
          type: 'xy'
        },
        loading: {
          hideDuration: 0,
          showDuration: 0,
          labelStyle: {
            display: 'none'
          }
        },
        events: {
          load: function () {
            const chart = this;
            const x = chart.plotLeft + chart.plotWidth / 2; // Center X
            const y = chart.plotTop + chart.plotHeight / 2; // Center Y
            chart.renderer
                .text('E V E R Y W A T C H', x, y)
                .css({
                  color: '#DFDEE0',
                  fontSize: '24px',
                  fontWeight: 'bold',
                  textAlign: 'center'
                })
                .attr({
                  zIndex: -1,
                  align: 'center'
                })
                .add();
          }
        }
      },
      credits: {
        enabled: false
      },
      title: {
        text: ''
      },
      xAxis: {
        type: 'datetime',
        dateTimeLabelFormats: {
          millisecond: '%b %Y',
          second: '%b %Y',
          minute: '%b %Y',
          hour: '%b %Y',
          week: '%e %b %Y',
          day: '%b %Y',
          month: '%b %Y',
          year: '%Y'
        },
        labels: {
          style: {
            color: '#001633'
          }
        },
        lineColor: '#999999',
        tickColor: '#999999',
        tickAmount: 3,
        startOnTick: false,
        endOnTick: false,
        min: ${startDate.millisecondsSinceEpoch},
        max: ${endDate.millisecondsSinceEpoch},
        tickPositions: [
          ${startDate.millisecondsSinceEpoch},
          ${startDate.millisecondsSinceEpoch + totalDuration ~/ 2},
          ${endDate.millisecondsSinceEpoch}
        ]
      },
      yAxis: {
        min: 0,
        max: $yAxisMax,
        minPadding: 0.1,
        maxPadding: 0,
        softThreshold: false,
        title: {
          text: 'Price',
          align: 'high',
          verticalAlign: 'top',
          x: 40,
          y: -20,
          rotation: 0,
          style: {
            color: '#001633'
          }
        },
        lineColor: '#999999',
        tickColor: '#999999',
        alignTicks: false,
        endOnTick: true,
        showLastLabel: true,
      },
      legend: {
        enabled: true
      },
      tooltip: {
        followPointer: false,
        followTouchMove: false,
        useHTML: true,
        borderRadius: 12,
        padding: 10,
        style: {
          pointerEvents: 'auto'
        },
        hideDelay: 800,
        stickOnContact: true
      },
      series: [
        $scatterChartData,
        $unsoldScatterChartData,
        {
          data: [$seriesData],
          name: "Auction median",
          type: "spline",
          dashStyle: "ShortDash",
          color: "#001633",
          lineWidth: 3,
          marker: {
            enabled: false
          },
          stickyTracking: false,
        }
      ]
    }''';
  }

  String _generateWatchPriceAnalysisChartData(
      PriceAnalysisGraphStruct priceAnalysisGraph) {
    final auctionData = priceAnalysisGraph.auctionPriceAnalysis;

    // Construct data points for the chart without quotes around keys
    final dataPoints = auctionData
        .where((item) => item.lotStatusId == 2) // Filter condition
        .map((item) {
      return '''
    {
      x: ${item.eventPublishEndDate.millisecondsSinceEpoch},
      y: ${item.netPayableUsd},
      item: {
        watchId: ${item.watchId},
        eventPublishEndDate: "${item.eventPublishEndDate}",
        slug: "${item.slug}",
        modelSlug: "${item.modelSlug}",
        manufacturerSlug: "${item.manufacturerSlug}",
        netPayableUsd: ${item.netPayableUsd},
        netPayableSgd: ${item.netPayableSgd},
        netPayableHkd: ${item.netPayableHkd},
        netPayableGbp: ${item.netPayableGbp},
        netPayableEur: ${item.netPayableEur},
        netPayableChf: ${item.netPayableChf},
        netPayableAed: ${item.netPayableAed},
        netPayableJpy: ${item.netPayableJpy},
        referenceNumberId: ${item.referenceNumberId},
        modelId: ${item.modelId},
        manufacturerId: ${item.manufacturerId},
        manufacturerName: "${item.manufactureName}",
        modelName: "${item.modelName}",
        referenceNumber: "${item.referenceNumber}",
        primaryImage: {
          url: "${item.primaryImage?.url ?? ''}",
          previewEmail320: "${item.primaryImage?.previewEmail320 ?? ''}",
          preview320: "${item.primaryImage?.preview320 ?? ''}",
          preview480: "${item.primaryImage?.preview480 ?? ''}",
          preview768: "${item.primaryImage?.preview768 ?? ''}",
          preview960: "${item.primaryImage?.preview960 ?? ''}",
          preview1366: "${item.primaryImage?.preview1366 ?? ''}",
          original: "${item.primaryImage?.original ?? ''}",
          isPrimary: "${item.primaryImage?.isPrimary ?? ''}",
          isDeleted: "${item.primaryImage?.isDeleted ?? ''}",

        },
        lotStatusId: ${item.lotStatusId},
        infoSourceName: "${item.infoSourceName}",
      }
    }
    ''';
    }).join(',');

    // Return the HighChart data string
    return '''
  {
    data: [$dataPoints],
    name: "Sold auction lots",
    color: "#4682B466",
    type: "scatter",
    marker: {
      symbol: "circle",
      radius: 5,
      lineWidth: 1,
      lineColor: "#4682B4"
    },
    stickyTracking: false,
    cursor: "pointer"
  }
  ''';
  }

  String _generateUnsoldWatchPriceAnalysisChartData(
      PriceAnalysisGraphStruct priceAnalysisGraph) {
    final auctionData = priceAnalysisGraph.auctionPriceAnalysis;

    // Construct data points for the chart without quotes around keys
    final dataPoints = auctionData
        .where((item) => item.lotStatusId != 2) // Filter condition
        .map((item) {
      return '''
    {
      x: ${item.eventPublishEndDate.millisecondsSinceEpoch},
      y: ${item.netPayableUsd},
      item: {
        watchId: ${item.watchId},
        eventPublishEndDate: "${item.eventPublishEndDate}",
        slug: "${item.slug}",
        modelSlug: "${item.modelSlug}",
        manufacturerSlug: "${item.manufacturerSlug}",
        netPayableUsd: ${item.netPayableUsd},
        netPayableSgd: ${item.netPayableSgd},
        netPayableHkd: ${item.netPayableHkd},
        netPayableGbp: ${item.netPayableGbp},
        netPayableEur: ${item.netPayableEur},
        netPayableChf: ${item.netPayableChf},
        netPayableAed: ${item.netPayableAed},
        netPayableJpy: ${item.netPayableJpy},
        referenceNumberId: ${item.referenceNumberId},
        modelId: ${item.modelId},
        manufacturerId: ${item.manufacturerId},
        manufacturerName: "${item.manufactureName}",
        modelName: "${item.modelName}",
        referenceNumber: "${item.referenceNumber}",
        primaryImage: {
          url: "${item.primaryImage?.url ?? ''}",
          previewEmail320: "${item.primaryImage?.previewEmail320 ?? ''}",
          preview320: "${item.primaryImage?.preview320 ?? ''}",
          preview480: "${item.primaryImage?.preview480 ?? ''}",
          preview768: "${item.primaryImage?.preview768 ?? ''}",
          preview960: "${item.primaryImage?.preview960 ?? ''}",
          preview1366: "${item.primaryImage?.preview1366 ?? ''}",
          original: "${item.primaryImage?.original ?? ''}",
          isPrimary: "${item.primaryImage?.isPrimary ?? ''}",
          isDeleted: "${item.primaryImage?.isDeleted ?? ''}",

        },
        lotStatusId: ${item.lotStatusId},
        infoSourceName: "${item.infoSourceName}",
      }
    }
    ''';
    }).join(',');

    // Return the HighChart data string
    return '''
  {
    data: [$dataPoints],
    visible: false,
    showInLegend: true,
    name: "Unsold auction lots",
    color: "#B7787266",
    type: "scatter",
    marker: {
      symbol: "circle",
      radius: 5,
      lineWidth: 1,
      lineColor: "#B77872"
    },
    stickyTracking: false,
    cursor: "pointer"
  }
  ''';
  }

  void _getChartPriceAnalysisClicked() async {
    setState(() {
      _isChartLoading = true;
    });

    try {
      final watchDetail = WatchDetailResponseStruct.maybeFromMap(
        (await MutualWatchGroup.getWatchDetailByIdCall.call(
          accessToken: FFAppState().loginData.accessToken,
          variablesJson: _model.filter?.toMap(),
        ))
            .jsonBody,
      )?.data.data.data.watchDetails.watchDetail;

      final custFilter = WatchPriceAnalysisFilterStruct((b) => b
        ..model = [watchDetail?.defaultModelId.toString() ?? '']
        ..manufacturer = [watchDetail?.manufacturerId.toString() ?? '']
        ..auctionType = ["result"]
        ..referenceNumber = [
          watchDetail?.defaultReferenceNumberId.toString() ?? ''
        ]
        ..childReferenceNumber = [
          watchDetail?.referenceNumberId.toString() ?? ''
        ]
        ..caseMaterial = [watchDetail?.defaultCaseMaterialId.toString() ?? '']
        ..currencyMode = "USD"
        ..eventDateRange = _getDateRange(_selectedButtonIndex));

      final response =
          await MutualWatchGroup.apiWatchGetWatchPriceAnalysisGETCall.call(
        accessToken: FFAppState().loginData.accessToken,
        variablesJson: custFilter.toMap(),
      );

      if (response.succeeded && mounted) {
        _priceAnalysis =
            WatchPriceAnalysisResponseStruct.fromMap(response.jsonBody);

        setState(() {
          if (_priceAnalysis!.data.dealersPriceAnalysis.isNotEmpty) {
            _chartData = _generateDealersChartData(
                _priceAnalysis!.data.dealersPriceAnalysis,
                _generateWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph),
                _generateUnsoldWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph));
          } else if (_priceAnalysis!.data.auctionAnalysisMedians.isNotEmpty) {
            _chartData = _generateAuctionChartData(
                _priceAnalysis!.data.auctionAnalysisMedians,
                _generateWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph),
                _generateUnsoldWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph));
          } else {
            _chartData = _generateDealersChartData([], '', '');
          }

          _isChartLoading = false;
          _isInitialLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isChartLoading = false;
        _isInitialLoading = false;
      });
      print("Errorrrr: $e"); // Log any errors
    }
  }

  Map<String, dynamic> calculateDifferences(
      WatchPriceAnalysisResponseStruct? priceAnalysis) {
    final absoluteDifference = <String, double>{};
    final percentDifference = <String, String>{};

    // Define the keys to compare
    final keys = [
      'netPayableUsd',
      'netPayableSgd',
      'netPayableHkd',
      'netPayableGbp',
      'netPayableEur',
      'netPayableChf',
    ];

    for (var key in keys) {
      final currentVal =
          priceAnalysis?.data.currentValueAllCurrencies.toMap()[key] ?? 0.0;
      final previousVal =
          priceAnalysis?.data.firstValueAllCurrencies.toMap()[key] ?? 0.0;

      final diff = currentVal - previousVal;
      final percentDiff = previousVal != 0 ? (diff / previousVal) * 100 : 0;

      absoluteDifference[key] = diff;
      percentDifference[key] =
          "(${percentDiff.toStringAsFixed(2)}%)"; // Format to 2 decimal places
    }

    return {
      'absoluteDifference': absoluteDifference,
      'percentDifference': percentDifference,
    };
  }

  String generatePriceChartDescString(int selectedButton,
      double absoluteNetPayableUsd, String percentNetPayableUsd) {
    return '${(absoluteNetPayableUsd > 0 ? "+" : "") + NumberFormat('#,##0', 'en_US').format(absoluteNetPayableUsd.toInt())} USD $percentNetPayableUsd ${absoluteNetPayableUsd > 0 ? ' ↑' : absoluteNetPayableUsd < 0 ? ' ↓' : ''}${getTimeFilterDescription(selectedButton)}';
  }

  Color renderPriceChartDescColor(int absoluteNetPayableUsd) {
    return absoluteNetPayableUsd > 0
        ? FlutterFlowTheme.of(context).liveAuction
        : FlutterFlowTheme.of(context).error;
  }

  String getTimeFilterDescription(int selectedButton) {
    switch (selectedButton) {
      case 0:
        return 'past 3 months';
      case 1:
        return 'past 6 months';
      case 2:
        return 'past year';
      case 3:
        return 'past 2 years';
      case 4:
        return 'past 5 years';
      default:
        return 'all time'; // Default case for any other filter
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchPageModel());
    _watch = FFAppState().watchListingStruct;
    _model.filter = createWatchAnalysisFilterStruct(watchId: 2415857);
    _selectedButtonIndex = 0;

    // Initialize with empty chart structure
    _chartData = '''{
      chart: {
          backgroundColor: '#faf8f6',
          spacingLeft: -30,
          spacingRight: 20,
          spacingTop: 50,
          spacingBottom: 5,
          height: 400,
          borderRadius: 12,
          type: 'scatter'
      },
      series: [{
          data: [],
          name: 'Dealer median',
          type: 'spline',
          color: '#5F9EA0'
      }]
    }''';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _getChartPriceAnalysisClicked();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _model.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ApiCallResponse>>(
      future: Future.wait([
        MutualWatchGroup.getWatchAnalysisByIdCall.call(
          accessToken: FFAppState().loginData.accessToken,
          variablesJson: _model.filter?.toMap(),
        ),
        MutualWatchGroup.getWatchDetailByIdCall.call(
          accessToken: FFAppState().loginData.accessToken,
          variablesJson: _model.filter?.toMap(),
        )
      ]),
      builder: (context, snapshot) {
        // Show loading screen only on initial load
        if (!snapshot.hasData || _isInitialLoading) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final watchAnalysisResponse = snapshot.data![0];
        final watchAnalysis = WatchAnalysisResponseStruct.maybeFromMap(
                watchAnalysisResponse.jsonBody)
            ?.data
            .data
            .watchAnalysis;
        final watchDetailResponse = snapshot.data![1];
        final watchDetail =
            WatchDetailResponseStruct.maybeFromMap(watchDetailResponse.jsonBody)
                ?.data
                .data
                .data
                .watchDetails
                .watchDetail;

        final excludedFieldsWatchDetail =
            WatchDetailResponseStruct.maybeFromMap(watchDetailResponse.jsonBody)
                ?.data
                .extractWatchDetail();
        final isPremium = FFAppState().loginData.subscriptionTypeId == 1;
        List<Widget> watchImages = [];
        if (watchDetail?.watchImages != null) {
          for (var image in watchDetail!.watchImages) {
            watchImages.add(ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(image.original,
                  height: 300.0,
                  fit: BoxFit.cover, errorBuilder: (BuildContext context,
                      Object exception, StackTrace? stackTrace) {
                return const Center(child: Text('Failed to load image'));
              }),
            ));
          }
        }
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 52.0,
                icon: Icon(
                  FFIcons.kleft,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 32.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: const [],
              centerTitle: true,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            children: [
                              Container(
                                height: 330.0,
                                decoration: const BoxDecoration(),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 330.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 30.0),
                                        child: PageView(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(initialPage: 0),
                                          scrollDirection: Axis.horizontal,
                                          children: watchImages,
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 1.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 12.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 0),
                                            count: watchImages.length,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              safeSetState(() {});
                                            },
                                            effect: smooth_page_indicator
                                                .SlideEffect(
                                              spacing: 13.0,
                                              radius: 3.0,
                                              dotWidth: 6.0,
                                              dotHeight: 6.0,
                                              dotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: wrapWithModel(
                                  model: _model.pillBoldButtonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: PillBoldButtonWidget(
                                    title: 'Alert Me On Similar Watches',
                                    icon: Icon(
                                      FFIcons.kbox1,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _watch.manufactureName,
                                        'Hublot',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.12,
                                            fontWeight: FontWeight.bold,
                                            lineHeight: 1.43,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'REF ${valueOrDefault(_watch.referenceNumber, '-')}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'DM Sans',
                                            fontSize: 11.0,
                                            letterSpacing: 0.2,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 4.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              buttonSize: 48.0,
                                              icon: Icon(
                                                FFIcons.kshare,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.653,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _watch.modelName,
                                                '-',
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.16,
                                                        lineHeight: 1.33,
                                                      ),
                                            ),
                                          ),
                                          ToggleIcon(
                                            onPressed: () async {
                                              safeSetState(() =>
                                                  _model.isFavorite =
                                                      !_model.isFavorite);
                                            },
                                            value: _model.isFavorite,
                                            onIcon: Icon(
                                              Icons.favorite_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .badge,
                                              size: 24.0,
                                            ),
                                            offIcon: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 25.0,
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 0.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.twoButtonPageMenuModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: const TwoButtonPageMenuWidget(
                                        firstTitle: 'Details',
                                        secondTitle: 'Description',
                                      ),
                                    ),
                                  ),
                                  // Hidding the chart if there is no data
                                  if (_priceAnalysis == null ||
                                      (_priceAnalysis!.data.dealersPriceAnalysis
                                              .any((data) =>
                                                  data.medians.medianUsd !=
                                                  0) ||
                                          _priceAnalysis!
                                              .data.auctionAnalysisMedians
                                              .any((data) =>
                                                  data.medians.medianUsd != 0)))
                                    Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 12, bottom: 12),
                                                    child: Text(
                                                      "Price Chart",
                                                      style: TextStyle(
                                                        fontFamily: 'DM Sans',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            20, // Set your desired font size here
                                                      ),
                                                    ),
                                                  )),
                                                ),
                                                //Background color for the Price Chart Title Bottom Container
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 12),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lightGray,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 12,
                                                                  right: 12,
                                                                  top: 6,
                                                                  bottom: 6),
                                                          child: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'DM Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.08,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                              watchDetail !=
                                                                      null
                                                                  ? "${watchDetail.defaultManufacturerName} ${watchDetail.modelName} ${watchDetail.referenceNumber} | ${watchDetail.defaultCaseMaterialName}"
                                                                  : "-"),
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 12),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        height: 100,
                                                        child: Image.network(
                                                          watchDetail
                                                                  ?.watchImages[
                                                                      0]
                                                                  .url ??
                                                              '',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Current value",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.08,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              // Current value
                                                              Text(
                                                                "${NumberFormat('#,##0', 'en_US').format(_priceAnalysis?.data.currentValueAllCurrencies.netPayableUsd ?? 0)} USD",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      18, // Set your desired font size here
                                                                ),
                                                              ),
                                                              Text(
                                                                generatePriceChartDescString(
                                                                    _selectedButtonIndex,
                                                                    calculateDifferences(
                                                                            _priceAnalysis)['absoluteDifference']
                                                                        [
                                                                        'netPayableUsd'],
                                                                    calculateDifferences(
                                                                            _priceAnalysis)['percentDifference']
                                                                        [
                                                                        'netPayableUsd']),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      color: renderPriceChartDescColor(calculateDifferences(_priceAnalysis)['absoluteDifference']
                                                                              [
                                                                              'netPayableUsd']
                                                                          .toInt()), // Change color bases on the absolute difference
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.08,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 12),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lightGray,
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12,
                                                                      right: 12,
                                                                      top: 6,
                                                                      bottom:
                                                                          6),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'DM Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.08,
                                                                          ),
                                                                      "Auction High"),
                                                                  Text(
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'DM Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.08,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                      "${NumberFormat('#,##0', 'en_US').format(getHighestAuctionPrice(_priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis))} USD"), //Print the highest dealer price
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 12,
                                                      ),
                                                      Expanded(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lightGray,
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 12,
                                                                      right: 12,
                                                                      top: 6,
                                                                      bottom:
                                                                          6),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'DM Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.08,
                                                                          ),
                                                                      "Auction Low"),
                                                                  Text(
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'DM Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.08,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                      "${NumberFormat('#,##0', 'en_US').format(getLowestAuctionPrice(_priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis))} USD"),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Dealer High and Low
                                                if (_selectedButtonIndex >= 0 &&
                                                    _selectedButtonIndex <= 3)
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 12),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightGray,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            12,
                                                                        right:
                                                                            12,
                                                                        top: 6,
                                                                        bottom:
                                                                            6),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.08,
                                                                            ),
                                                                        "Dealer High"),
                                                                    Text(
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.08,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                        "${NumberFormat('#,##0', 'en_US').format(getHighestDealerPrice(_priceAnalysis?.data.dealersPriceAnalysis ?? []).toInt())} USD"), //Print the highest dealer price
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 12,
                                                        ),
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lightGray,
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            12,
                                                                        right:
                                                                            12,
                                                                        top: 6,
                                                                        bottom:
                                                                            6),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.08,
                                                                            ),
                                                                        "Dealer Low"),
                                                                    Text(
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.08,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                        "${NumberFormat('#,##0', 'en_US').format(getLowestDealerPrice(_priceAnalysis?.data.dealersPriceAnalysis ?? []).toInt())} USD"),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 12),
                                                  child: Container(
                                                    height: 1,
                                                    width: double.infinity,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lightGray,
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: IntrinsicHeight(
                                                      child: Row(
                                                        children: [
                                                          ChartFilterButton(
                                                            text: '3M',
                                                            color: Colors.red,
                                                            isSelected:
                                                                _selectedButtonIndex ==
                                                                    0,
                                                            onPressed: () {
                                                              setState(() =>
                                                                  _selectedButtonIndex =
                                                                      0);
                                                              _getChartPriceAnalysisClicked();
                                                            },
                                                          ),
                                                          ChartFilterButton(
                                                            text: '6M',
                                                            color: Colors.blue,
                                                            isSelected:
                                                                _selectedButtonIndex ==
                                                                    1,
                                                            onPressed: () {
                                                              setState(() =>
                                                                  _selectedButtonIndex =
                                                                      1);
                                                              _getChartPriceAnalysisClicked();
                                                            },
                                                          ),
                                                          ChartFilterButton(
                                                            text: '1Y',
                                                            color: Colors.green,
                                                            isSelected:
                                                                _selectedButtonIndex ==
                                                                    2,
                                                            onPressed: () {
                                                              setState(() =>
                                                                  _selectedButtonIndex =
                                                                      2);
                                                              _getChartPriceAnalysisClicked();
                                                            },
                                                          ),
                                                          ChartFilterButton(
                                                            text: '2Y',
                                                            color:
                                                                Colors.yellow,
                                                            isSelected:
                                                                _selectedButtonIndex ==
                                                                    3,
                                                            onPressed: () {
                                                              setState(() =>
                                                                  _selectedButtonIndex =
                                                                      3);
                                                              _getChartPriceAnalysisClicked();
                                                            },
                                                          ),
                                                          ChartFilterButton(
                                                            text: '5Y',
                                                            color:
                                                                Colors.purple,
                                                            isSelected:
                                                                _selectedButtonIndex ==
                                                                    4,
                                                            onPressed: () {
                                                              setState(() =>
                                                                  _selectedButtonIndex =
                                                                      4);
                                                              _getChartPriceAnalysisClicked();
                                                            },
                                                          ),
                                                          ChartFilterButton(
                                                            text: 'Max',
                                                            color:
                                                                Colors.orange,
                                                            isSelected:
                                                                _selectedButtonIndex ==
                                                                    5,
                                                            onPressed: () {
                                                              setState(() =>
                                                                  _selectedButtonIndex =
                                                                      5);
                                                              _getChartPriceAnalysisClicked();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_isChartLoading)
                                                  const SizedBox(
                                                    height: 440,
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                  )
                                                else
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 14),
                                                    child: HighCharts(
                                                      size: Size(
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                          420),
                                                      data: _chartData,
                                                      loader: SizedBox(
                                                        height: 440,
                                                        child: Center(
                                                          child: SizedBox(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                        ),
                                                      ),
                                                      scripts: const [
                                                        "https://code.highcharts.com/highcharts.js",
                                                        'https://code.highcharts.com/modules/networkgraph.js',
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  Stack(
                                    children: [
                                      if (_model.twoButtonPageMenuModel
                                          .isFirstSelected)
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .auctionPriceCardModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: AuctionPriceCardWidget(
                                                    estimationPrice:
                                                        _watch.parsePrice(),
                                                    salePrice: _watch
                                                        .retailPrice
                                                        .toString(),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .specificationsCardModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SpecificationsCardWidget(
                                                      excludedFieldsWatchDetail:
                                                          excludedFieldsWatchDetail),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .priceGuideCardModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: PriceGuideCardWidget(
                                                    scrollController:
                                                        _scrollController,
                                                    watchAnalysis:
                                                        watchAnalysis,
                                                    downArrow: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 16.0,
                                                    ),
                                                    upArrow: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 16.0,
                                                    ),
                                                    brand:
                                                        _watch.manufactureName,
                                                    model: _watch.modelName,
                                                    referenceNumber:
                                                        _watch.referenceNumber,
                                                  ),
                                                ),
                                              ].divide(
                                                  const SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      if (!_model.twoButtonPageMenuModel
                                          .isFirstSelected)
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 12.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lightGray,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .border2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          watchDetail
                                                                  ?.description ??
                                                              "No description.",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                letterSpacing:
                                                                    0.08,
                                                                lineHeight:
                                                                    1.43,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(const SizedBox(
                                                        height: 14.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
