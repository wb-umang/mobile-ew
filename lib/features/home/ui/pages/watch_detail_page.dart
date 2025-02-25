import 'dart:io';
import 'dart:math' as math;

import 'package:every_watch/backend/schema/structs/index.dart';
import 'package:every_watch/backend/schema/structs/watch_analysis_response_struct.dart';
import 'package:every_watch/backend/schema/structs/watch_price_analysis_filter_struct.dart';
import 'package:every_watch/backend/schema/structs/watch_price_analysis_response_struct.dart';
import 'package:every_watch/core/common/widgets/auction_price_card/auction_price_card_widget.dart';
import 'package:every_watch/core/common/widgets/pill_bold_button/pill_bold_button_widget.dart';
import 'package:every_watch/core/common/widgets/price_guide_card/price_guide_card_widget.dart';
import 'package:every_watch/core/common/widgets/specifications_card/specifications_card_widget.dart';
import 'package:every_watch/core/common/widgets/two_button_page_menu/two_button_page_menu_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_widgets.dart';
import 'package:every_watch/pages/watch_page/chart_filter_button.dart';
import 'package:every_watch/pages/watch_page/watch_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:high_chart/high_chart.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchDetailPage extends StatefulWidget {
  const WatchDetailPage({super.key});

  @override
  State<WatchDetailPage> createState() => _WatchDetailPageState();
}

class _WatchDetailPageState extends State<WatchDetailPage> {
  late WatchPageModel _model;
  late WatchListingStruct _watch;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  int _selectedButtonIndex = 0;
  late String _chartData;
  bool _isChartLoading = false;
  bool _isInitialLoading = true;
  WatchPriceAnalysisResponseStruct? _priceAnalysis;
  final _unsoldController = ValueNotifier<bool>(false);
  final _outliersController = ValueNotifier<bool>(false);
  bool _unsold = false;
  bool _outliers = false;
  bool _isInitialOutliersClicked = false;
  bool isLandscapeMode = false;
  bool isPreviousData = false;
  List<bool>? chartFilterBlockList;
  final isPremium = FFAppState().loginData.subscriptionTypeId == 1;
  bool isFirstTimeIndexSelection = true;

  double calculateMedianPrice(PriceAnalysisGraphStruct priceAnalysisGraph) {
    final auctionPriceAnalysis = priceAnalysisGraph.auctionPriceAnalysis;
    final dealersPriceAnalysis = priceAnalysisGraph.dealersPriceAnalysis;
    final auctionAnalysisMedians = priceAnalysisGraph.auctionAnalysisMedians;

// Function to round a value to the nearest specified magnitude
    double roundToNearest(double value) {
      // Step 1: Find the nearest power of 10 (base unit for rounding)
      int numDigits = value > 0 ? math.log(value) ~/ math.log(10) : 0;
      double baseUnit = math.pow(10, numDigits).toDouble();

      // Step 2: Compute the rounded value
      double roundedValue = (value / (baseUnit / 10)).ceil() * (baseUnit / 10);

      return roundedValue;
    }

    // Function to calculate the median
    double calculateMedian(List<double> numbers) {
      if (numbers.isEmpty) return 0.0; // Return 0 if the list is empty
      final sortedNumbers = List<double>.from(numbers)..sort();
      final length = sortedNumbers.length;
      final mid = length ~/ 2;

      if (length % 2 == 0) {
        // For even-length arrays, return the average of the two middle numbers
        return (sortedNumbers[mid - 1] + sortedNumbers[mid]) / 2;
      } else {
        // For odd-length arrays, return the middle number
        return sortedNumbers[mid];
      }
    }

    final dealerMedian = dealersPriceAnalysis
        .where((item) => item.medians.medianUsd != 0)
        .map((item) => item.medians.medianUsd)
        .toList();

    final auctionMedian = auctionAnalysisMedians
        .where((item) => item.medians.medianUsd != 0)
        .map((item) => item.medians.medianUsd)
        .toList();

    // Calculate the median price
    final auctionPriceMedian = auctionPriceAnalysis
        .where((item) => item.netPayableUsd != 0)
        .map((item) => item.netPayableUsd)
        .toList();

    // Calculate the overall median of dealerMedian, auctionMedian, and auctionPriceMedian
    final combinedMedians = [
      ...dealerMedian,
      ...auctionMedian,
      ...auctionPriceMedian
    ];
    final medianPrice = roundToNearest(calculateMedian(combinedMedians));

    return medianPrice;
  }

  void _switchToLandscapeMode() async {
    // Switch to landscape and update state
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    setState(() {
      isLandscapeMode = true;

      if (_priceAnalysis!
          .data.priceAnalysisGraph.dealersPriceAnalysis.isNotEmpty) {
        _chartData = _generateDealersChartData(
            _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
            _generateWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, _outliers),
            _generateUnsoldWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
            _outliers,
            _priceAnalysis!.data.priceAnalysisGraph);
      } else if (_priceAnalysis!
          .data.priceAnalysisGraph.auctionAnalysisMedians.isNotEmpty) {
        _chartData = _generateAuctionChartData(
            _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
            _generateWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, _outliers),
            _generateUnsoldWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
            _outliers,
            _priceAnalysis!.data.priceAnalysisGraph);
      } else if (_priceAnalysis!
          .data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty) {
        if (_selectedButtonIndex <= 3) {
          _chartData = _generateDealersChartData(
              _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, _outliers),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
              _outliers,
              _priceAnalysis!.data.priceAnalysisGraph);
        } else {
          _chartData = _generateAuctionChartData(
              _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, _outliers),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
              _outliers,
              _priceAnalysis!.data.priceAnalysisGraph);
        }
      } else {
        _chartData = _generateDealersChartData(
            [], '', '', _outliers, _priceAnalysis!.data.priceAnalysisGraph);
      }
    });
  }

  String formatDate(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  void _exitLandscapeMode() async {
    // Switch back to portrait and update state
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    setState(() {
      isLandscapeMode = false;

      if (_priceAnalysis!.data.dealersPriceAnalysis.isNotEmpty) {
        _chartData = _generateDealersChartData(
            _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
            _generateWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, _outliers),
            _generateUnsoldWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
            _outliers,
            _priceAnalysis!.data.priceAnalysisGraph);
      } else if (_priceAnalysis!
          .data.priceAnalysisGraph.auctionAnalysisMedians.isNotEmpty) {
        _chartData = _generateAuctionChartData(
            _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
            _generateWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, _outliers),
            _generateUnsoldWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
            _outliers,
            _priceAnalysis!.data.priceAnalysisGraph);
      } else if (_priceAnalysis!
          .data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty) {
        if (_selectedButtonIndex <= 3) {
          _chartData = _generateDealersChartData(
              _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, _outliers),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
              _outliers,
              _priceAnalysis!.data.priceAnalysisGraph);
        } else {
          _chartData = _generateAuctionChartData(
              _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, _outliers),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, false, _outliers),
              _outliers,
              _priceAnalysis!.data.priceAnalysisGraph);
        }
      } else {
        _chartData = _generateDealersChartData(
            [], '', '', _outliers, _priceAnalysis!.data.priceAnalysisGraph);
      }
    });
  }

  String _generateDealersChartData(
      List<DealerPriceAnalysisStruct> priceAnalysis,
      String scatterChartData,
      String unsoldScatterChartData,
      bool isOutliers,
      PriceAnalysisGraphStruct priceAnalysisGraph) {
    // Function to round a value to the nearest specified magnitude
    double roundToNearest(double value) {
      // Step 1: Find the nearest power of 10 (base unit for rounding)
      int numDigits = value > 0 ? math.log(value) ~/ math.log(10) : 0;
      double baseUnit = math.pow(10, numDigits).toDouble();

      // Step 2: Compute the rounded value
      double roundedValue = (value / (baseUnit / 10)).ceil() * (baseUnit / 10);

      return roundedValue;
    }

    // Create a map to store unique date entries with their latest values
    final Map<String, double> uniqueDateValues = {};

    final medianPrice = calculateMedianPrice(priceAnalysisGraph);

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
      if (priceAnalysisGraph.auctionPriceAnalysis.isEmpty) {
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
      } else {
        // Filter non-zero values and get unique entries for each date
        for (var data in priceAnalysisGraph.auctionPriceAnalysis) {
          if (data.netPayableUsd != 0) {
            final parsedDate =
                DateTime.parse(formatDate(data.eventPublishEndDate));
            final dateKey = DateTime.utc(parsedDate.year, parsedDate.month,
                    parsedDate.day, 0, 0, 0, 0, 0)
                .toIso8601String()
                .split('T')[0];

            uniqueDateValues[dateKey] = data.netPayableUsd;
          }
        }
      }
    }

    // Convert the map entries to sorted list
    final sortedEntriesWithOutliers = uniqueDateValues.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    final sortedEntries = sortedEntriesWithOutliers.where((element) {
      if (shouldShowOutliersButton() && !isOutliers) {
        // If outliers are not shown, ignore items with medianUsd above double the calculated median
        return element.value <= (medianPrice * 2);
      }
      return true;
    }).toList();

    // Calculate x-axis values
    final dates = sortedEntries.map((e) => DateTime.parse(e.key)).toList();
    final auctionDates = _priceAnalysis
        ?.data.priceAnalysisGraph.auctionPriceAnalysis
        .map((data) => DateTime.parse(data.eventPublishEndDate.toString()))
        .toList();

    final startDate = auctionDates == null || auctionDates.isEmpty
        ? dates.first
        : dates.first
                .isBefore(auctionDates.reduce((a, b) => a.isBefore(b) ? a : b))
            ? dates.first
            : auctionDates.reduce((a, b) => a.isBefore(b) ? a : b);

    // Set endDate to yesterday
    final yesterday = DateTime.now().subtract(Duration(days: 1));

    final adjustedEndDate = yesterday;

    final totalDuration = adjustedEndDate.difference(startDate).inMilliseconds;
    // Calculate y-axis max value
    final maxPrice = uniqueDateValues.values.reduce((a, b) => a > b ? a : b);

    final chartHeight =
        isLandscapeMode ? MediaQuery.of(context).size.width.toInt() - 40 : 400;

    final yAxisMax = isOutliers
        ? roundToNearest(getMaxPriceAnalysis(false))
        : roundToNearest(maxPrice * 1.8);

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
          height: $chartHeight,
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
          max: ${adjustedEndDate.millisecondsSinceEpoch},
          tickPositions: [
            ${startDate.millisecondsSinceEpoch},
            ${startDate.millisecondsSinceEpoch + totalDuration ~/ 2},
            ${adjustedEndDate.millisecondsSinceEpoch}
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
          hideDelay: 0,
          stickOnContact: true,
          formatter: function() {
            if (!this.point.item) {
              // For median line points
              return '<div>' +
                '<span>' + 
                  'Dealer median: ' +
                '</span>' +
                '<span style="font-weight: bold;">' + 
                Highcharts.numberFormat(this.y, 0) + ' USD' +
                '</span>' +
                '</div>';

            }
            
            // For scatter points (auction lots)
            var point = this.point.item;
            return '<div class="chart-tooltip">' +
              '<div style="display: flex; gap: 4px;">' +
                '<div style="flex: 0 0 60px;">' +
                  '<img src="' + (point.primaryImage.preview480 || '') + '" ' +
                  'style="width: 70px; height: 70px; object-fit: contain; border-radius: 8px;" />' +
                '</div>' +
                '<div style="flex: 1;">' +
                  '<div style="font-weight: bold; font-size: 14px;">' + point.manufacturerName + '</div>' +
                  '<div style="color: #666; font-size: 12px;">' + 
                    point.modelName + ' ' + point.referenceNumber +
                  '</div>' +
                  '<div style="color: #666; font-weight: 700; color: rgba(4, 7, 49, .722); font-size: 12px;">Source: ' + point.infoSourceName + '</div>' +
                  '<div style="margin-top: 8px;">' +
                    '<span style="font-weight: bold;">' + 
                      Highcharts.numberFormat(point.netPayableUsd, 0) + ' USD' +
                    '</span>' +
                    '<span style="color: #666;"> | </span>' +
                    '<span style="color: #666;">' + 
                      Highcharts.dateFormat('%d %b %Y', this.x) +
                    '</span>' +
                  '</div>' +
                '</div>' +
              '</div>' +
            '</div>';
          }
      },
      plotOptions: {
        spline: {
          cursor: 'pointer',
          point: {
            events: {
              click: function() {
                if (this.item && this.item.slug) {
                  flutter_inappwebview.postMessage(JSON.stringify({
                    manufacturerSlug: this.item.manufacturerSlug,
                    modelSlug: this.item.modelSlug,
                    watchId: this.item.watchId
                  }));
                }
              }
            }
          }
        }
      },
      series: [
      ${_generateScatterChartDataString(scatterChartData, unsoldScatterChartData)}
      {
          data: ${priceAnalysisGraph.dealersPriceAnalysis.isEmpty ? [] : [
            seriesData
          ]},
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

  String _generateScatterChartDataString(
      String scatterChartData, String unsoldScatterChartData) {
    if (_priceAnalysis!
        .data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty) {
      return '''
          $scatterChartData,
          $unsoldScatterChartData,
          ''';
    } else {
      return '''
          ''';
    }
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
      String unsoldScatterChartData,
      bool isOutliers,
      PriceAnalysisGraphStruct priceAnalysisGraph) {
    // Function to round a value to the nearest specified magnitude
    double roundToNearest(double value) {
      // Step 1: Find the nearest power of 10 (base unit for rounding)
      int numDigits = value > 0 ? math.log(value) ~/ math.log(10) : 0;
      double baseUnit = math.pow(10, numDigits).toDouble();

      // Step 2: Compute the rounded value
      double roundedValue = (value / (baseUnit / 10)).ceil() * (baseUnit / 10);

      return roundedValue;
    }

    // Create a map to store unique date entries with their latest values
    final Map<String, double> uniqueDateValues = {};

    final medianPrice = calculateMedianPrice(priceAnalysisGraph);

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
      if (priceAnalysisGraph.auctionPriceAnalysis.isEmpty) {
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
      } else {
        // Filter non-zero values and get unique entries for each date
        for (var data in priceAnalysisGraph.auctionPriceAnalysis) {
          if (data.netPayableUsd != 0) {
            final parsedDate =
                DateTime.parse(formatDate(data.eventPublishEndDate));
            final dateKey = DateTime.utc(parsedDate.year, parsedDate.month,
                    parsedDate.day, 0, 0, 0, 0, 0)
                .toIso8601String()
                .split('T')[0];

            uniqueDateValues[dateKey] = data.netPayableUsd;
          }
        }
      }
    }

    // Convert the map entries to sorted list
    final sortedEntriesWithOutliers = uniqueDateValues.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    final sortedEntries = sortedEntriesWithOutliers.where((element) {
      if (shouldShowOutliersButton() && !isOutliers) {
        // If outliers are not shown, ignore items with medianUsd above double the calculated median
        return element.value <= (medianPrice * 2);
      }
      return true;
    }).toList();

    // Calculate x-axis values
    final dates = sortedEntries.map((e) => DateTime.parse(e.key)).toList();
    final auctionDates = _priceAnalysis
        ?.data.priceAnalysisGraph.auctionPriceAnalysis
        .map((data) => DateTime.parse(data.eventPublishEndDate.toString()))
        .toList();

    final startDate = auctionDates == null || auctionDates.isEmpty
        ? dates.first
        : dates.first
                .isBefore(auctionDates.reduce((a, b) => a.isBefore(b) ? a : b))
            ? dates.first
            : auctionDates.reduce((a, b) => a.isBefore(b) ? a : b);

    final endDate = DateTime.now().subtract(Duration(days: 1));

    final totalDuration = endDate.difference(startDate).inMilliseconds;

    final chartHeight =
        isLandscapeMode ? MediaQuery.of(context).size.width.toInt() - 40 : 400;

    // Calculate y-axis max value
    final maxPrice = uniqueDateValues.values.reduce((a, b) => a > b ? a : b);
    final yAxisMax = isOutliers
        ? roundToNearest(getMaxPriceAnalysis(true))
        : roundToNearest(maxPrice * 1.8);

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
        height: $chartHeight,
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
        hideDelay: 0,
        stickOnContact: true,
        formatter: function() {
          if (!this.point.item) {
            // For median line points
            return '<div>' +
              '<span>' + 
                'Auction median: ' +
              '</span>' +
              '<span style="font-weight: bold;">' + 
              Highcharts.numberFormat(this.y, 0) + ' USD' +
              '</span>' +
              '</div>';
          }
          
          // For scatter points (auction lots)
          var point = this.point.item;
          return '<div class="chart-tooltip">' +
            '<div style="display: flex; gap: 4px;">' +
              '<div style="flex: 0 0 60px;">' +
                '<img src="' + (point.primaryImage.preview480 || '') + '" ' +
                'style="width: 70px; height: 70px; object-fit: contain; border-radius: 8px;" />' +
              '</div>' +

              '<div style="flex: 1;">' +
                '<div style="font-weight: bold; font-size: 14px;">' + point.manufacturerName + '</div>' +
                '<div style="color: #666; font-size: 12px;">' + 
                  point.modelName + ' ' + point.referenceNumber +
                '</div>' +
                '<div style="color: #666; font-weight: 700; color: rgba(4, 7, 49, .722); font-size: 12px;">Source: ' + point.infoSourceName + '</div>' +
                '<div style="margin-top: 8px;">' +
                  '<span style="font-weight: bold;">' + 
                    Highcharts.numberFormat(point.netPayableUsd, 0) + ' USD' +
                  '</span>' +
                  '<span style="color: #666;"> | </span>' +
                  '<span style="color: #666;">' + 
                    Highcharts.dateFormat('%d %b %Y', this.x) +
                  '</span>' +
                '</div>' +
              '</div>' +
            '</div>' +
          '</div>';
        }
      },
      plotOptions: {
        scatter: {
          cursor: 'pointer',
          point: {
            events: {
              click: function() {
                if (this.item && this.item.slug) {
                  window.flutter_inappwebview.postMessage(JSON.stringify({
                    manufacturerSlug: this.item.manufacturerSlug,
                    modelSlug: this.item.modelSlug,
                    watchId: this.item.watchId
                  }));
                }
              }
            }
          }
        }
      },
      series: [
        ${_generateScatterChartDataString(scatterChartData, unsoldScatterChartData)}
        {
           data: ${priceAnalysisGraph.auctionAnalysisMedians.isEmpty ? [] : [
            seriesData
          ]},
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
      PriceAnalysisGraphStruct priceAnalysisGraph, bool isOutliers) {
    final auctionPriceAnalysis = priceAnalysisGraph.auctionPriceAnalysis;
    final dealersPriceAnalysis = priceAnalysisGraph.dealersPriceAnalysis;
    final auctionAnalysisMedians = priceAnalysisGraph.auctionAnalysisMedians;

    // Check if the auctionPriceAnalysis is empty
    if (auctionPriceAnalysis.isEmpty) {
      return '''''';
    }

    // Function to round a value to the nearest specified magnitude
    double roundToNearest(double value) {
      // Step 1: Find the nearest power of 10 (base unit for rounding)
      int numDigits = value > 0 ? math.log(value) ~/ math.log(10) : 0;
      double baseUnit = math.pow(10, numDigits).toDouble();

      // Step 2: Compute the rounded value
      double roundedValue = (value / (baseUnit / 10)).ceil() * (baseUnit / 10);

      return roundedValue;
    }

    // Function to calculate the median
    double calculateMedian(List<double> numbers) {
      if (numbers.isEmpty) return 0.0; // Return 0 if the list is empty
      final sortedNumbers = List<double>.from(numbers)..sort();
      final length = sortedNumbers.length;
      final mid = length ~/ 2;

      if (length % 2 == 0) {
        // For even-length arrays, return the average of the two middle numbers
        return (sortedNumbers[mid - 1] + sortedNumbers[mid]) / 2;
      } else {
        // For odd-length arrays, return the middle number
        return sortedNumbers[mid];
      }
    }

    final dealerMedian = dealersPriceAnalysis
        .where((item) => item.medians.medianUsd != 0)
        .map((item) => item.medians.medianUsd)
        .toList();

    final auctionMedian = auctionAnalysisMedians
        .where((item) => item.medians.medianUsd != 0)
        .map((item) => item.medians.medianUsd)
        .toList();

    // Calculate the median price
    final auctionPriceMedian = auctionPriceAnalysis
        .where((item) => item.netPayableUsd != 0)
        .map((item) => item.netPayableUsd)
        .toList();

    // Calculate the overall median of dealerMedian, auctionMedian, and auctionPriceMedian
    final combinedMedians = [
      ...dealerMedian,
      ...auctionMedian,
      ...auctionPriceMedian
    ];
    final medianPrice = roundToNearest(calculateMedian(combinedMedians));

    // Filter auction data based on _outliers
    final filteredAuctionData = auctionPriceAnalysis.where((item) {
      return item.lotStatusId == 2 && item.netPayableUsd != 0;
    }).toList();

    // Construct data points for the chart without quotes around keys
    final dataPoints = filteredAuctionData.where((item) {
      if (shouldShowOutliersButton() && !isOutliers) {
        // If outliers are not shown, ignore items with medianUsd above double the calculated median
        return item.netPayableUsd <= (medianPrice * 2);
      }
      return true;
    }).map((item) {
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
      PriceAnalysisGraphStruct priceAnalysisGraph,
      bool isUnsold,
      bool isOutliers) {
    final auctionPriceAnalysis = priceAnalysisGraph.auctionPriceAnalysis;
    final dealersPriceAnalysis = priceAnalysisGraph.dealersPriceAnalysis;
    final auctionAnalysisMedians = priceAnalysisGraph.auctionAnalysisMedians;

    // Check if the auctionPriceAnalysis is empty
    if (auctionPriceAnalysis.isEmpty) {
      return '''''';
    }

    // Function to round a value to the nearest specified magnitude
    double roundToNearest(double value) {
      // Step 1: Find the nearest power of 10 (base unit for rounding)
      int numDigits = value > 0 ? math.log(value) ~/ math.log(10) : 0;
      double baseUnit = math.pow(10, numDigits).toDouble();

      // Step 2: Compute the rounded value
      double roundedValue = (value / (baseUnit / 10)).ceil() * (baseUnit / 10);

      return roundedValue;
    }

    // Function to calculate the median
    double calculateMedian(List<double> numbers) {
      if (numbers.isEmpty) return 0.0; // Return 0 if the list is empty
      final sortedNumbers = List<double>.from(numbers)..sort();
      final length = sortedNumbers.length;
      final mid = length ~/ 2;

      if (length % 2 == 0) {
        // For even-length arrays, return the average of the two middle numbers
        return (sortedNumbers[mid - 1] + sortedNumbers[mid]) / 2;
      } else {
        // For odd-length arrays, return the middle number
        return sortedNumbers[mid];
      }
    }

    final dealerMedian = dealersPriceAnalysis
        .where((item) => item.medians.medianUsd != 0)
        .map((item) => item.medians.medianUsd)
        .toList();

    final auctionMedian = auctionAnalysisMedians
        .where((item) => item.medians.medianUsd != 0)
        .map((item) => item.medians.medianUsd)
        .toList();

    // Calculate the median price
    final auctionPriceMedian = auctionPriceAnalysis
        .where((item) => item.netPayableUsd != 0)
        .map((item) => item.netPayableUsd)
        .toList();

    // Calculate the overall median of dealerMedian, auctionMedian, and auctionPriceMedian
    final combinedMedians = [
      ...dealerMedian,
      ...auctionMedian,
      ...auctionPriceMedian
    ];
    final medianPrice = roundToNearest(calculateMedian(combinedMedians));

    // Filter auction data based on _outliers
    final filteredAuctionData = auctionPriceAnalysis.where((item) {
      // If outliers are not shown, ignore items with medianUsd above double the calculated median
      return item.lotStatusId != 2;
    }).toList();

    // Construct data points for the chart without quotes around keys
    final dataPoints = filteredAuctionData.where((item) {
      if (shouldShowOutliersButton() && !isOutliers) {
        // If outliers are not shown, ignore items with medianUsd above double the calculated median
        return item.netPayableUsd <= (medianPrice * 2);
      }
      return true;
    }).map((item) {
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
    visible: $isUnsold,
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

  void _getChartPriceAnalysisClicked(bool unsold, bool outliers) async {
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
        ..referenceNumber =
            watchDetail?.defaultReferenceNumberId.toString() == '0' ||
                    watchDetail?.manufacturerId == 100 ||
                    watchDetail?.manufacturerId == 267
                ? null
                : [watchDetail?.defaultReferenceNumberId.toString() ?? '']
        ..childReferenceNumber =
            watchDetail?.referenceNumberId.toString() == '0' ||
                    watchDetail?.manufacturerId == 100 ||
                    watchDetail?.manufacturerId == 267
                ? null
                : [watchDetail?.referenceNumberId.toString() ?? '']
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
          if (_priceAnalysis!
              .data.priceAnalysisGraph.dealersPriceAnalysis.isNotEmpty) {
            isPreviousData = true;

            _chartData = _generateDealersChartData(
                _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
                _generateWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph, _outliers),
                _generateUnsoldWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph, unsold, outliers),
                outliers,
                _priceAnalysis!.data.priceAnalysisGraph);
          } else if (_priceAnalysis!
              .data.priceAnalysisGraph.auctionAnalysisMedians.isNotEmpty) {
            isPreviousData = true;

            _chartData = _generateAuctionChartData(
                _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
                _generateWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph, _outliers),
                _generateUnsoldWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph, unsold, outliers),
                outliers,
                _priceAnalysis!.data.priceAnalysisGraph);
          } else if (_priceAnalysis!
              .data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty) {
            isPreviousData = true;

            if (_selectedButtonIndex <= 3) {
              _chartData = _generateDealersChartData(
                  _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
                  _generateWatchPriceAnalysisChartData(
                      _priceAnalysis!.data.priceAnalysisGraph, _outliers),
                  _generateUnsoldWatchPriceAnalysisChartData(
                      _priceAnalysis!.data.priceAnalysisGraph,
                      unsold,
                      outliers),
                  outliers,
                  _priceAnalysis!.data.priceAnalysisGraph);
            } else {
              _chartData = _generateAuctionChartData(
                  _priceAnalysis!
                      .data.priceAnalysisGraph.auctionAnalysisMedians,
                  _generateWatchPriceAnalysisChartData(
                      _priceAnalysis!.data.priceAnalysisGraph, _outliers),
                  _generateUnsoldWatchPriceAnalysisChartData(
                      _priceAnalysis!.data.priceAnalysisGraph,
                      unsold,
                      outliers),
                  outliers,
                  _priceAnalysis!.data.priceAnalysisGraph);
            }
          } else {
            _chartData = _generateDealersChartData(
                [], '', '', outliers, _priceAnalysis!.data.priceAnalysisGraph);
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
      double absoluteNetPayableUsd, String percentNetPayableUsd,
      [bool? isPremiumAvailable]) {
    return '${(absoluteNetPayableUsd > 0 ? "+" : "") + (isPremiumAvailable != null && isPremiumAvailable ? NumberFormat('#,##0', 'en_US').format(absoluteNetPayableUsd.toInt()) : "XXX")} USD ${isPremiumAvailable != null && isPremiumAvailable ? percentNetPayableUsd : "(X.XX%)"} ${absoluteNetPayableUsd > 0 ? ' ↑' : absoluteNetPayableUsd < 0 ? ' ↓' : ''}${getTimeFilterDescription(selectedButton)}';
  }

  Color renderPriceChartDescColor(int absoluteNetPayableUsd,
      [bool? isPremiumAvailable]) {
    return (isPremiumAvailable != null && !isPremiumAvailable) ||
            absoluteNetPayableUsd > 0
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

  double getMaxPriceAnalysis(bool isAuctionData) {
    // Get the maximum price from dealersPriceAnalysis
    double maxDealerPrice =
        getHighestDealerPrice(_priceAnalysis?.data.dealersPriceAnalysis);

    double maxAuctionMedianPrice = getHighestAuctionMedianPrice(
        _priceAnalysis?.data.auctionAnalysisMedians);

    // Get the maximum price from auctionPriceAnalysis
    double maxAuctionPrice = getOverallHighestAuctionPrice(
        _priceAnalysis?.data.priceAnalysisGraph.auctionPriceAnalysis ?? []);

    // Return the maximum of both
    return isAuctionData
        ? maxAuctionMedianPrice > maxAuctionPrice
            ? maxAuctionMedianPrice
            : maxAuctionPrice
        : maxDealerPrice > maxAuctionPrice
            ? maxDealerPrice
            : maxAuctionPrice;
  }

  // Calculate the threshold for showing the outliers button
  bool shouldShowOutliersButton() {
    // Function to round a value to the nearest specified magnitude
    double roundToNearest(double value) {
      // Step 1: Find the nearest power of 10 (base unit for rounding)
      int numDigits = value > 0 ? math.log(value) ~/ math.log(10) : 0;
      double baseUnit = math.pow(10, numDigits).toDouble();

      // Step 2: Compute the rounded value
      double roundedValue = (value / (baseUnit / 10)).ceil() * (baseUnit / 10);

      return roundedValue;
    }

    // Function to calculate the median
    double calculateMedian(List<double> numbers) {
      if (numbers.isEmpty) return 0.0; // Return 0 if the list is empty
      final sortedNumbers = List<double>.from(numbers)..sort();
      final length = sortedNumbers.length;
      final mid = length ~/ 2;

      if (length % 2 == 0) {
        // For even-length arrays, return the average of the two middle numbers
        return (sortedNumbers[mid - 1] + sortedNumbers[mid]) / 2;
      } else {
        // For odd-length arrays, return the middle number
        return sortedNumbers[mid];
      }
    }

    final dealerMedian = _priceAnalysis?.data.dealersPriceAnalysis
            .map((item) => item.medians.medianUsd)
            .toList() ??
        [];

    final auctionMedian = _priceAnalysis?.data.auctionAnalysisMedians
            .map((item) => item.medians.medianUsd)
            .toList() ??
        [];

    // Calculate the median price
    final auctionPriceMedian = _priceAnalysis
            ?.data.priceAnalysisGraph.auctionPriceAnalysis
            .map((item) => item.netPayableUsd)
            .toList() ??
        [];

    // Calculate the overall median of dealerMedian, auctionMedian, and auctionPriceMedian
    final combinedMedians = [
      ...dealerMedian,
      ...auctionMedian,
      ...auctionPriceMedian
    ];
    final medianPrice = roundToNearest(calculateMedian(combinedMedians));

    final double threshold = medianPrice * 2;

    // Check if any values are above the threshold
    bool areDealersAboveThreshold = _priceAnalysis?.data.dealersPriceAnalysis
            .any((dealer) => dealer.medians.medianUsd > threshold) ??
        false;
    bool areAuctionsAboveThreshold = _priceAnalysis?.data.auctionAnalysisMedians
            .any((auction) => auction.medians.medianUsd > threshold) ??
        false;
    bool areAuctionPricesAboveThreshold = _priceAnalysis
            ?.data.priceAnalysisGraph.auctionPriceAnalysis
            .any((auctionPrice) => auctionPrice.netPayableUsd > threshold) ??
        false;

    return areDealersAboveThreshold ||
        areAuctionsAboveThreshold ||
        areAuctionPricesAboveThreshold;
  }

  bool isValidDealersData(WatchPriceAnalysisResponseStruct? priceAnalysisData) {
    if (priceAnalysisData
            ?.data.priceAnalysisGraph.dealersPriceAnalysis.isEmpty ??
        false) {
      return false;
    }
    return priceAnalysisData?.data.priceAnalysisGraph.dealersPriceAnalysis
            .every((dealer) => dealer.medians.medianUsd == 0) ??
        true;
  }

  String renderCaseMaterialName(WatchListingStruct watchDetail) {
    if (watchDetail.referenceNumberId == watchDetail.defaultReferenceNumberId &&
        watchDetail.defaultCaseMaterialId != "") {
      return "| ${watchDetail.defaultCaseMaterialName}";
    } else {
      return "";
    }
  }

  List<bool> checkDateFilters(GraphDataPoints watchGraphDataPoints) {
    final now = DateTime.now();
    DateTime? auctionFirstPointDate;
    DateTime? dealersFirstPointDate;

    if (watchGraphDataPoints.dealersFirstPointDate != '') {
      dealersFirstPointDate =
          DateTime.parse(watchGraphDataPoints.dealersFirstPointDate);
    }
    if (watchGraphDataPoints.auctionFirstPointDate != '') {
      auctionFirstPointDate =
          DateTime.parse(watchGraphDataPoints.auctionFirstPointDate);
    }

    // Define the time spans for dealersFirstPointDate
    final dealerTimeSpans = {
      '3 months': Duration(days: 90),
      '6 months': Duration(days: 180),
      '1 year': Duration(days: 365),
      '2 years': Duration(days: 730),
    };

    // Define the time spans for auctionFirstPointDate
    final auctionTimeSpans = {
      '5 years': Duration(days: 1825),
      'max': Duration(days: 365 * 100) // Assuming max is 100 years
    };

    // Create a list to hold the results
    List<bool> results = [];

    if (dealersFirstPointDate != null) {
      // Check dealersFirstPointDate against each time span
      for (var duration in dealerTimeSpans.values) {
        final startDate = now.subtract(duration);
        results.add(dealersFirstPointDate.isAfter(startDate));
      }
    } else {
      results = [
        false,
        false,
        false,
        false,
      ];
    }

    if (auctionFirstPointDate != null) {
      // Check auctionFirstPointDate against each time span
      for (var duration in auctionTimeSpans.values) {
        final startDate = now.subtract(duration);
        results.add(auctionFirstPointDate.isAfter(startDate));
      }
    } else {
      results.add(false);
      results.add(false);
    }

    return results;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchPageModel());
    _watch = FFAppState().watchListingStruct;
    final watchID = _watch.watchId;
    _model.filter = createWatchAnalysisFilterStruct(watchId: watchID);

    _unsoldController.addListener(() {
      setState(() {
        if (_priceAnalysis!
            .data.priceAnalysisGraph.dealersPriceAnalysis.isNotEmpty) {
          _chartData = _generateDealersChartData(
              _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, _outliers),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph,
                  _unsoldController.value,
                  _outliers),
              _outliers,
              _priceAnalysis!.data.priceAnalysisGraph);
        } else if (_priceAnalysis!
            .data.priceAnalysisGraph.auctionAnalysisMedians.isNotEmpty) {
          _chartData = _generateAuctionChartData(
              _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph, _outliers),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph,
                  _unsoldController.value,
                  _outliers),
              _outliers,
              _priceAnalysis!.data.priceAnalysisGraph);
        } else if (_priceAnalysis!
            .data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty) {
          if (_selectedButtonIndex <= 3) {
            _chartData = _generateDealersChartData(
                _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
                _generateWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph, _outliers),
                _generateUnsoldWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph,
                    _unsoldController.value,
                    _outliers),
                _outliers,
                _priceAnalysis!.data.priceAnalysisGraph);
          } else {
            _chartData = _generateAuctionChartData(
                _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
                _generateWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph, _outliers),
                _generateUnsoldWatchPriceAnalysisChartData(
                    _priceAnalysis!.data.priceAnalysisGraph,
                    _unsoldController.value,
                    _outliers),
                _outliers,
                _priceAnalysis!.data.priceAnalysisGraph);
          }
        } else {
          _chartData = _generateDealersChartData(
              [], '', '', _outliers, _priceAnalysis!.data.priceAnalysisGraph);
        }

        if (_unsoldController.value) {
          _unsold = true;
        } else {
          _unsold = false;
        }
      });
    });

    _outliersController.addListener(() {
      if (_priceAnalysis!
          .data.priceAnalysisGraph.dealersPriceAnalysis.isNotEmpty) {
        _chartData = _generateDealersChartData(
            _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
            _generateWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph,
                _outliersController.value),
            _generateUnsoldWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph,
                _unsold,
                _outliersController.value),
            _outliersController.value,
            _priceAnalysis!.data.priceAnalysisGraph);
      } else if (_priceAnalysis!
          .data.priceAnalysisGraph.auctionAnalysisMedians.isNotEmpty) {
        _chartData = _generateAuctionChartData(
            _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
            _generateWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph,
                _outliersController.value),
            _generateUnsoldWatchPriceAnalysisChartData(
                _priceAnalysis!.data.priceAnalysisGraph,
                _unsold,
                _outliersController.value),
            _outliersController.value,
            _priceAnalysis!.data.priceAnalysisGraph);
      } else if (_priceAnalysis!
          .data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty) {
        if (_selectedButtonIndex <= 3) {
          _chartData = _generateDealersChartData(
              _priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph,
                  _outliersController.value),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph,
                  _unsold,
                  _outliersController.value),
              _outliersController.value,
              _priceAnalysis!.data.priceAnalysisGraph);
        } else {
          _chartData = _generateAuctionChartData(
              _priceAnalysis!.data.priceAnalysisGraph.auctionAnalysisMedians,
              _generateWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph,
                  _outliersController.value),
              _generateUnsoldWatchPriceAnalysisChartData(
                  _priceAnalysis!.data.priceAnalysisGraph,
                  _unsold,
                  _outliersController.value),
              _outliersController.value,
              _priceAnalysis!.data.priceAnalysisGraph);
        }
      } else {
        _chartData = _generateDealersChartData(
            [], '', '', _outliers, _priceAnalysis!.data.priceAnalysisGraph);
      }

      setState(() {
        _isInitialOutliersClicked = true;
        if (_outliersController.value) {
          _outliers = true;
        } else {
          _outliers = false;
        }
      });
    });

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
        _getChartPriceAnalysisClicked(_unsold, _outliers);
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

        final watchGraphDataPoints =
            WatchDetailResponseStruct.maybeFromMap(watchDetailResponse.jsonBody)
                ?.data
                .data
                .data
                .watchDetails
                .graphDataPoints;

        if (isFirstTimeIndexSelection) {
          if (watchGraphDataPoints != null) {
            // Populate chartFilterBlockList based on available data
            chartFilterBlockList = checkDateFilters(watchGraphDataPoints);

            // Set _selectedButtonIndex based on chartFilterBlockList
            _selectedButtonIndex = chartFilterBlockList?.indexOf(true) ?? 0;

            // If no true value is found, it will default to -1, so we can set it to 0 if needed
            if (_selectedButtonIndex == -1) {
              _selectedButtonIndex =
                  0; // Default to 0 if no true value is found
            }
          }
          isFirstTimeIndexSelection = false;
        }

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
            appBar: isLandscapeMode
                ? null
                : AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
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
            body: isLandscapeMode
                ? SafeArea(
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Platform.isIOS ? 14 : 0,
                            ),
                            child: HighCharts(
                              size: Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.width),
                              data: _chartData,
                              loader: Container(),
                              scripts: const [
                                "https://code.highcharts.com/highcharts.js",
                                'https://code.highcharts.com/modules/networkgraph.js',
                              ],
                            ),
                          ),
                        ),
                        if (isLandscapeMode)
                          Positioned(
                            top: 30,
                            right: 24,
                            child: GestureDetector(
                              onTap: _exitLandscapeMode,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.close,
                                    color: Colors.white, size: 18),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : SafeArea(
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                  alignment:
                                      const AlignmentDirectional(0.0, 1.0),
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
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 30.0),
                                              child: PageView(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: 0),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: watchImages,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 1.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: 0),
                                                  count: watchImages.length,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) async {
                                                    await _model
                                                        .pageViewController!
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 30.0),
                                      child: wrapWithModel(
                                        model: _model.pillBoldButtonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PillBoldButtonWidget(
                                          title: 'Alert Me On Similar Watches',
                                          icon: Icon(
                                            FFIcons.kbox1,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
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
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _watch.manufactureName,
                                              'Hublot',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'DM Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.12,
                                                  fontWeight: FontWeight.bold,
                                                  lineHeight: 1.43,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.653,
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _watch.modelName,
                                                      '-',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .badge,
                                                    size: 24.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.favorite_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 25.0,
                                                  ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 0.0)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 24.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model:
                                                _model.twoButtonPageMenuModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child:
                                                const TwoButtonPageMenuWidget(
                                              firstTitle: 'Details',
                                              secondTitle: 'Description',
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            if (_model.twoButtonPageMenuModel
                                                .isFirstSelected)
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .auctionPriceCardModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            AuctionPriceCardWidget(
                                                          estimationPrice:
                                                              _watch
                                                                  .parsePrice(),
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
                                                      // Price Chart
                                                      // Hidding the chart if there is no data
                                                      if (isPreviousData ||
                                                          (_priceAnalysis!
                                                                  .data
                                                                  .priceAnalysisGraph
                                                                  .dealersPriceAnalysis
                                                                  .isNotEmpty ||
                                                              _priceAnalysis!
                                                                  .data
                                                                  .priceAnalysisGraph
                                                                  .auctionPriceAnalysis
                                                                  .isNotEmpty))
                                                        if (!isValidDealersData(
                                                            _priceAnalysis))
                                                          Container(
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: double
                                                                          .infinity,
                                                                      child: Center(
                                                                          child: Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                12,
                                                                            bottom:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "Price Chart",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'DM Sans',
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
                                                                          bottom:
                                                                              12),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Container(
                                                                            width: double.infinity,
                                                                            decoration: BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).lightGray,
                                                                            ),
                                                                            child: Padding(
                                                                              padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                                              child: Text(
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'DM Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.08,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                  watchDetail != null ? "${watchDetail.defaultManufacturerName} ${watchDetail.modelName} ${watchDetail.referenceNumber} ${renderCaseMaterialName(watchDetail)}" : "-"),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    if (!isPremium ||
                                                                        (_priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis.isNotEmpty ||
                                                                            _priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty))
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 12),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 100,
                                                                              height: 100,
                                                                              child: Image.network(
                                                                                watchDetail?.watchImages[0].url ?? '',
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                child: Skeletonizer(
                                                                                  enabled: _isChartLoading,
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        "Current value",
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'DM Sans',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.08,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                      // Current value
                                                                                      Text(
                                                                                        _selectedButtonIndex <= 2 || isPremium ? "${NumberFormat('#,##0', 'en_US').format(_priceAnalysis?.data.currentValueAllCurrencies.netPayableUsd ?? 0)} USD" : "XX,XXX USD",
                                                                                        style: TextStyle(
                                                                                          fontFamily: 'DM Sans',
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 18, // Set your desired font size here
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        generatePriceChartDescString(_selectedButtonIndex, calculateDifferences(_priceAnalysis)['absoluteDifference']['netPayableUsd'], calculateDifferences(_priceAnalysis)['percentDifference']['netPayableUsd'], _selectedButtonIndex <= 2 || isPremium),
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'DM Sans',
                                                                                              color: renderPriceChartDescColor(calculateDifferences(_priceAnalysis)['absoluteDifference']['netPayableUsd'].toInt(), _selectedButtonIndex <= 2 || isPremium), // Change color bases on the absolute difference
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.08,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (!isPremium ||
                                                                        _priceAnalysis!
                                                                            .data
                                                                            .priceAnalysisGraph
                                                                            .auctionPriceAnalysis
                                                                            .isNotEmpty)
                                                                      if (_selectedButtonIndex >
                                                                          2)
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(bottom: 12),
                                                                          child:
                                                                              Skeletonizer(
                                                                            enabled:
                                                                                _isChartLoading,
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).lightGray,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                                                        child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'DM Sans',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.08,
                                                                                                    ),
                                                                                                "Auction High"),
                                                                                            if (_selectedButtonIndex <= 2 || isPremium) ...[
                                                                                              Text(
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'DM Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.08,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                  "${NumberFormat('#,##0', 'en_US').format(getHighestAuctionPrice(_priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis))} USD"), //Print the highest dealer price
                                                                                            ] else
                                                                                              Row(
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'DM Sans',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.08,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                        "Get premium to view"),
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 4,
                                                                                                  ),
                                                                                                  Visibility(
                                                                                                    visible: !isPremium,
                                                                                                    child: Icon(
                                                                                                      FFIcons.klock,
                                                                                                      color: Color(0xFFAC835D),
                                                                                                      size: 16.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              ),
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
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).lightGray,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                                                        child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'DM Sans',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.08,
                                                                                                    ),
                                                                                                "Auction Low"),
                                                                                            if (_selectedButtonIndex <= 2 || isPremium) ...[
                                                                                              Text(
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'DM Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.08,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                  "${NumberFormat('#,##0', 'en_US').format(getLowestAuctionPrice(_priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis))} USD"),
                                                                                            ] else
                                                                                              Row(
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'DM Sans',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.08,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                        "Get premium to view"),
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 4,
                                                                                                  ),
                                                                                                  Visibility(
                                                                                                    visible: !isPremium,
                                                                                                    child: Icon(
                                                                                                      FFIcons.klock,
                                                                                                      color: Color(0xFFAC835D),
                                                                                                      size: 16.0,
                                                                                                    ),
                                                                                                  )
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
                                                                    // Dealer High and Low
                                                                    if (_selectedButtonIndex >=
                                                                            0 &&
                                                                        _selectedButtonIndex <=
                                                                            3)
                                                                      Skeletonizer(
                                                                        enabled:
                                                                            _isChartLoading,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.only(bottom: 12),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Expanded(
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).lightGray,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                                                      child: Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'DM Sans',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.08,
                                                                                                  ),
                                                                                              "Dealer High"),
                                                                                          if (_selectedButtonIndex <= 2 || isPremium) ...[
                                                                                            Text(
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'DM Sans',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.08,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                "${NumberFormat('#,##0', 'en_US').format(getHighestDealerPrice(_priceAnalysis?.data.dealersPriceAnalysis ?? []).toInt())} USD"), //Print the highest dealer price
                                                                                          ] else
                                                                                            Row(
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'DM Sans',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.08,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                      "Get premium to view"),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 4,
                                                                                                ),
                                                                                                Visibility(
                                                                                                  visible: !isPremium,
                                                                                                  child: Icon(
                                                                                                    FFIcons.klock,
                                                                                                    color: Color(0xFFAC835D),
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                            ),
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
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).lightGray,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                                                      child: Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'DM Sans',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.08,
                                                                                                  ),
                                                                                              "Dealer Low"),
                                                                                          if (_selectedButtonIndex <= 2 || isPremium) ...[
                                                                                            Text(
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'DM Sans',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.08,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                "${NumberFormat('#,##0', 'en_US').format(getLowestDealerPrice(_priceAnalysis?.data.dealersPriceAnalysis ?? []).toInt())} USD"),
                                                                                          ] else
                                                                                            Row(
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'DM Sans',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.08,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                      "Get premium to view"),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 4,
                                                                                                ),
                                                                                                Visibility(
                                                                                                  visible: !isPremium,
                                                                                                  child: Icon(
                                                                                                    FFIcons.klock,
                                                                                                    color: Color(0xFFAC835D),
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                )
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
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              12),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            1,
                                                                        width: double
                                                                            .infinity,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightGray,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          IntrinsicHeight(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            ChartFilterButton(
                                                                              isFirst: true,
                                                                              text: '3M',
                                                                              color: Colors.red,
                                                                              isBlocked: chartFilterBlockList?[0] ?? false,
                                                                              isSelected: _selectedButtonIndex == 0,
                                                                              onPressed: () {
                                                                                if (_selectedButtonIndex != 0) {
                                                                                  // Check if not already selected
                                                                                  setState(() => _selectedButtonIndex = 0);
                                                                                  _getChartPriceAnalysisClicked(_unsold, _outliers);
                                                                                }
                                                                              },
                                                                            ),
                                                                            ChartFilterButton(
                                                                              text: '6M',
                                                                              color: Colors.blue,
                                                                              isBlocked: chartFilterBlockList?[1] ?? false,
                                                                              isSelected: _selectedButtonIndex == 1,
                                                                              onPressed: () {
                                                                                if (_selectedButtonIndex != 1) {
                                                                                  // Check if not already selected
                                                                                  setState(() => _selectedButtonIndex = 1);
                                                                                  _getChartPriceAnalysisClicked(_unsold, _outliers);
                                                                                }
                                                                              },
                                                                            ),
                                                                            ChartFilterButton(
                                                                              text: '1Y',
                                                                              color: Colors.green,
                                                                              isBlocked: chartFilterBlockList?[2] ?? false,
                                                                              isSelected: _selectedButtonIndex == 2,
                                                                              onPressed: () {
                                                                                if (_selectedButtonIndex != 2) {
                                                                                  // Check if not already selected
                                                                                  setState(() => _selectedButtonIndex = 2);
                                                                                  _getChartPriceAnalysisClicked(_unsold, _outliers);
                                                                                }
                                                                              },
                                                                            ),
                                                                            ChartFilterButton(
                                                                              text: '2Y',
                                                                              color: Colors.yellow,
                                                                              isBlocked: chartFilterBlockList?[3] ?? false,
                                                                              isSelected: _selectedButtonIndex == 3,
                                                                              onPressed: () {
                                                                                if (_selectedButtonIndex != 3) {
                                                                                  // Check if not already selected
                                                                                  setState(() => _selectedButtonIndex = 3);
                                                                                  if (isPremium) _getChartPriceAnalysisClicked(_unsold, _outliers);
                                                                                }
                                                                              },
                                                                            ),
                                                                            ChartFilterButton(
                                                                              text: '5Y',
                                                                              color: Colors.purple,
                                                                              isBlocked: chartFilterBlockList?[4] ?? false,
                                                                              isSelected: _selectedButtonIndex == 4,
                                                                              onPressed: () {
                                                                                if (_selectedButtonIndex != 4) {
                                                                                  // Check if not already selected
                                                                                  setState(() => _selectedButtonIndex = 4);
                                                                                  if (isPremium) _getChartPriceAnalysisClicked(_unsold, _outliers);
                                                                                }
                                                                              },
                                                                            ),
                                                                            ChartFilterButton(
                                                                              isBorderRight: true,
                                                                              isLast: true,
                                                                              text: 'Max',
                                                                              color: Colors.orange,
                                                                              isBlocked: chartFilterBlockList?[5] ?? false,
                                                                              isSelected: _selectedButtonIndex == 5,
                                                                              onPressed: () {
                                                                                if (_selectedButtonIndex != 5) {
                                                                                  // Check if not already selected
                                                                                  setState(() => _selectedButtonIndex = 5);
                                                                                  if (isPremium) _getChartPriceAnalysisClicked(_unsold, _outliers);
                                                                                }
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    if (_priceAnalysis !=
                                                                            null &&
                                                                        _priceAnalysis!
                                                                            .data
                                                                            .priceAnalysisGraph
                                                                            .auctionPriceAnalysis
                                                                            .isNotEmpty)
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(top: 12),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            if (_priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis.any((element) =>
                                                                                element.lotStatusId !=
                                                                                2))
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFE6E8F0),
                                                                                      width: 1,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(top: 6, bottom: 6),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'DM Sans',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.08,
                                                                                                ),
                                                                                            "Show Unsold"),
                                                                                        SizedBox(
                                                                                          width: 10,
                                                                                        ),
                                                                                        if (isPremium) AdvancedSwitch(enabled: !_isChartLoading, width: 30.0, height: 18.0, controller: _unsoldController, activeColor: FlutterFlowTheme.of(context).primary, inactiveColor: Color.fromRGBO(4, 7, 49, 0.42)),
                                                                                        if (!isPremium)
                                                                                          Visibility(
                                                                                            visible: !isPremium,
                                                                                            child: Icon(
                                                                                              FFIcons.klock,
                                                                                              color: Color(0xFFAC835D),
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if ((!isPremium || shouldShowOutliersButton()) &&
                                                                                (_priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis.any((element) => element.lotStatusId != 2)))
                                                                              SizedBox(
                                                                                width: 12,
                                                                              ),
                                                                            // Show Outliers Button
                                                                            if (!isPremium ||
                                                                                shouldShowOutliersButton())
                                                                              Expanded(
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                    color: !isPremium || _isInitialOutliersClicked ? null : Color(0xFF001633),
                                                                                    border: Border.all(
                                                                                      color: !isPremium || _isInitialOutliersClicked ? Color(0xFFE6E8F0) : Color(0xFF001633),
                                                                                      width: 1,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(top: 6, bottom: 6),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'DM Sans',
                                                                                                  color: !isPremium || _isInitialOutliersClicked ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.08,
                                                                                                ),
                                                                                            "Show Outliers"),
                                                                                        SizedBox(
                                                                                          width: 10,
                                                                                        ),
                                                                                        if (isPremium) AdvancedSwitch(enabled: !_isChartLoading, width: 30.0, height: 18.0, controller: _outliersController, activeColor: FlutterFlowTheme.of(context).primary, inactiveColor: Color.from(alpha: 0.42, red: 0.016, green: 0.027, blue: 0.192)),
                                                                                        if (!isPremium)
                                                                                          Visibility(
                                                                                            visible: !isPremium,
                                                                                            child: Icon(
                                                                                              FFIcons.klock,
                                                                                              color: Color(0xFFAC835D),
                                                                                              size: 16.0,
                                                                                            ),
                                                                                          )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (_isChartLoading)
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                12,
                                                                            bottom:
                                                                                12),
                                                                        child:
                                                                            Skeletonizer(
                                                                          enabled:
                                                                              true,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                            child:
                                                                                Container(
                                                                              height: 420,
                                                                              width: double.infinity,
                                                                              color: FlutterFlowTheme.of(context).hint,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    else if (!isPremium ||
                                                                        (_priceAnalysis!.data.priceAnalysisGraph.dealersPriceAnalysis.isNotEmpty ||
                                                                            _priceAnalysis!.data.priceAnalysisGraph.auctionPriceAnalysis.isNotEmpty)) ...[
                                                                      if (_selectedButtonIndex <=
                                                                              2 ||
                                                                          isPremium) ...[
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(top: 12),
                                                                          child:
                                                                              HighCharts(
                                                                            size:
                                                                                Size(MediaQuery.of(context).size.width, 420),
                                                                            data:
                                                                                _chartData,
                                                                            loader:
                                                                                Container(),
                                                                            scripts: const [
                                                                              "https://code.highcharts.com/highcharts.js",
                                                                              'https://code.highcharts.com/modules/networkgraph.js',
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ] else
                                                                        SizedBox(
                                                                          height:
                                                                              420,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              'Get Premium to View',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'DM Sans',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.08,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                    ] else
                                                                      SizedBox(
                                                                        height:
                                                                            420,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            'No data available for selected time period!',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: 'DM Sans',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.08,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),

                                                      if ((_priceAnalysis!
                                                                  .data
                                                                  .priceAnalysisGraph
                                                                  .dealersPriceAnalysis
                                                                  .isNotEmpty ||
                                                              _priceAnalysis!
                                                                  .data
                                                                  .priceAnalysisGraph
                                                                  .auctionPriceAnalysis
                                                                  .isNotEmpty) &&
                                                          (_selectedButtonIndex <=
                                                                  2 ||
                                                              isPremium)) ...[
                                                        FFButtonWidget(
                                                          onPressed: () {
                                                            if (!_isChartLoading) {
                                                              _switchToLandscapeMode();
                                                            }
                                                          },
                                                          text:
                                                              "View in Landscape Mode",
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 44.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      lineHeight:
                                                                          1.47,
                                                                    ),
                                                            borderSide:
                                                                const BorderSide(
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                      ],
                                                      wrapWithModel(
                                                        model: _model
                                                            .priceGuideCardModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            PriceGuideCardWidget(
                                                          scrollController:
                                                              _scrollController,
                                                          watchAnalysis:
                                                              watchAnalysis,
                                                          downArrow: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 16.0,
                                                          ),
                                                          upArrow: Icon(
                                                            Icons
                                                                .keyboard_arrow_up,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 16.0,
                                                          ),
                                                          brand: _watch
                                                              .manufactureName,
                                                          model:
                                                              _watch.modelName,
                                                          referenceNumber: _watch
                                                              .referenceNumber,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                    ].divide(const SizedBox(
                                                        height: 12.0)),
                                                  ),
                                                ),
                                              ),
                                            if (!_model.twoButtonPageMenuModel
                                                .isFirstSelected)
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lightGray,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .border2,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                watchDetail
                                                                        ?.description ??
                                                                    "No description.",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                          ].divide(
                                                              const SizedBox(
                                                                  height:
                                                                      14.0)),
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
