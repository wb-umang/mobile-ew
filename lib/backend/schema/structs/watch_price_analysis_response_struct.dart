import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WatchPriceAnalysisResponseStruct extends BaseStruct {
  WatchPriceAnalysisResponseStruct({
    bool? success,
    String? message,
    String? error,
    PriceAnalysisDataStruct? data,
  })  : _success = success,
        _message = message,
        _error = error,
        _data = data;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;
  bool hasSuccess() => _success != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "error" field.
  String? _error;
  String get error => _error ?? '';
  set error(String? val) => _error = val;
  bool hasError() => _error != null;

  // "data" field.
  PriceAnalysisDataStruct? _data;
  PriceAnalysisDataStruct get data => _data ?? PriceAnalysisDataStruct();
  set data(PriceAnalysisDataStruct? val) => _data = val;
  bool hasData() => _data != null;

  static WatchPriceAnalysisResponseStruct fromMap(Map<String, dynamic> data) =>
      WatchPriceAnalysisResponseStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        error: data['error'] as String?,
        data: PriceAnalysisDataStruct.maybeFromMap(data['data']),
      );

  static WatchPriceAnalysisResponseStruct? maybeFromMap(dynamic data) => data
          is Map
      ? WatchPriceAnalysisResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
        'error': _error,
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  String toString() => 'WatchPriceAnalysisResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WatchPriceAnalysisResponseStruct &&
        success == other.success &&
        message == other.message &&
        error == other.error &&
        data == other.data;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([success, message, error, data]);

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(_success, ParamType.bool),
        'message': serializeParam(_message, ParamType.String),
        'error': serializeParam(_error, ParamType.String),
        'data': serializeParam(_data, ParamType.DataStruct),
      }.withoutNulls;
}

class PriceAnalysisDataStruct extends BaseStruct {
  PriceAnalysisDataStruct({
    List<DealerPriceAnalysisStruct>? dealersPriceAnalysis,
    CurrentValueStruct? currentValueAllCurrencies,
    CurrentValueStruct? firstValueAllCurrencies,
    PriceAnalysisGraphStruct? priceAnalysisGraph,
    List<AuctionAnalysisMedianStruct>? auctionAnalysisMedians,
  })  : _dealersPriceAnalysis = dealersPriceAnalysis,
        _currentValueAllCurrencies = currentValueAllCurrencies,
        _firstValueAllCurrencies = firstValueAllCurrencies,
        _priceAnalysisGraph = priceAnalysisGraph,
        _auctionAnalysisMedians = auctionAnalysisMedians;

  List<DealerPriceAnalysisStruct>? _dealersPriceAnalysis;
  List<DealerPriceAnalysisStruct> get dealersPriceAnalysis =>
      _dealersPriceAnalysis ?? [];
  set dealersPriceAnalysis(List<DealerPriceAnalysisStruct>? val) =>
      _dealersPriceAnalysis = val;
  bool hasDealersPriceAnalysis() => _dealersPriceAnalysis != null;

  CurrentValueStruct? _currentValueAllCurrencies;
  CurrentValueStruct get currentValueAllCurrencies =>
      _currentValueAllCurrencies ?? CurrentValueStruct();
  set currentValueAllCurrencies(CurrentValueStruct? val) =>
      _currentValueAllCurrencies = val;
  bool hasCurrentValueAllCurrencies() => _currentValueAllCurrencies != null;

  CurrentValueStruct? _firstValueAllCurrencies;
  CurrentValueStruct get firstValueAllCurrencies =>
      _firstValueAllCurrencies ?? CurrentValueStruct();
  set firstValueAllCurrencies(CurrentValueStruct? val) =>
      _firstValueAllCurrencies = val;
  bool hasFirstValueAllCurrencies() => _firstValueAllCurrencies != null;

  PriceAnalysisGraphStruct? _priceAnalysisGraph;
  PriceAnalysisGraphStruct get priceAnalysisGraph =>
      _priceAnalysisGraph ?? PriceAnalysisGraphStruct();
  set priceAnalysisGraph(PriceAnalysisGraphStruct? val) =>
      _priceAnalysisGraph = val;
  bool hasPriceAnalysisGraph() => _priceAnalysisGraph != null;

  List<AuctionAnalysisMedianStruct>? _auctionAnalysisMedians;
  List<AuctionAnalysisMedianStruct> get auctionAnalysisMedians =>
      _auctionAnalysisMedians ?? [];

  static PriceAnalysisDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PriceAnalysisDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  static PriceAnalysisDataStruct fromMap(Map<String, dynamic> data) {
    final graphData = data['data']['data']['priceAnalysisGraph'];
    return PriceAnalysisDataStruct(
      dealersPriceAnalysis: (graphData['dealersPriceAnalysis'] as List?)
          ?.map((e) => DealerPriceAnalysisStruct.fromMap(e))
          .toList(),
      currentValueAllCurrencies:
          CurrentValueStruct.fromMap(graphData['currentValueAllCurrencies']),
      firstValueAllCurrencies:
          CurrentValueStruct.fromMap(graphData['firstValueAllCurrencies']),
      priceAnalysisGraph: PriceAnalysisGraphStruct.fromMap(graphData),
      auctionAnalysisMedians: (graphData['auctionAnalysisMedians'] as List?)
          ?.map((e) => AuctionAnalysisMedianStruct.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'dealersPriceAnalysis':
            _dealersPriceAnalysis?.map((e) => e.toMap()).toList(),
        'currentValueAllCurrencies': _currentValueAllCurrencies?.toMap(),
        'firstValueAllCurrencies': _firstValueAllCurrencies?.toMap(),
        'priceAnalysisGraph': _priceAnalysisGraph?.toMap(),
        'auctionAnalysisMedians':
            _auctionAnalysisMedians?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dealersPriceAnalysis':
            serializeParam(_dealersPriceAnalysis, ParamType.DataStruct),
        'currentValueAllCurrencies':
            serializeParam(_currentValueAllCurrencies, ParamType.DataStruct),
        'firstValueAllCurrencies':
            serializeParam(_firstValueAllCurrencies, ParamType.DataStruct),
        'priceAnalysisGraph':
            serializeParam(_priceAnalysisGraph, ParamType.DataStruct),
        'auctionAnalysisMedians':
            serializeParam(_auctionAnalysisMedians, ParamType.DataStruct),
      }.withoutNulls;
}

class DealerPriceAnalysisStruct extends BaseStruct {
  DealerPriceAnalysisStruct({
    String? timeRange,
    MediansStruct? medians,
  })  : _timeRange = timeRange,
        _medians = medians;

  String? _timeRange;
  String get timeRange => _timeRange ?? '';
  set timeRange(String? val) => _timeRange = val;
  bool hasTimeRange() => _timeRange != null;

  MediansStruct? _medians;
  MediansStruct get medians => _medians ?? MediansStruct();
  set medians(MediansStruct? val) => _medians = val;
  bool hasMedians() => _medians != null;

  static DealerPriceAnalysisStruct fromMap(Map<String, dynamic> data) =>
      DealerPriceAnalysisStruct(
        timeRange: data['timeRange'] as String?,
        medians: MediansStruct.fromMap(data['medians']),
      );

  Map<String, dynamic> toMap() => {
        'timeRange': _timeRange,
        'medians': _medians?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timeRange': serializeParam(_timeRange, ParamType.String),
        'medians': serializeParam(_medians, ParamType.DataStruct),
      }.withoutNulls;
}

class MediansStruct extends BaseStruct {
  MediansStruct({
    double? medianUsd,
    double? medianHkd,
    double? medianEur,
    double? medianGbp,
    double? medianChf,
    double? medianSgd,
  })  : _medianUsd = medianUsd,
        _medianHkd = medianHkd,
        _medianEur = medianEur,
        _medianGbp = medianGbp,
        _medianChf = medianChf,
        _medianSgd = medianSgd;

  double? _medianUsd;
  double get medianUsd => _medianUsd ?? 0.0;
  set medianUsd(double? val) => _medianUsd = val;
  bool hasMedianUsd() => _medianUsd != null;

  double? _medianHkd;
  double get medianHkd => _medianHkd ?? 0.0;
  set medianHkd(double? val) => _medianHkd = val;
  bool hasMedianHkd() => _medianHkd != null;

  double? _medianEur;
  double get medianEur => _medianEur ?? 0.0;
  set medianEur(double? val) => _medianEur = val;
  bool hasMedianEur() => _medianEur != null;

  double? _medianGbp;
  double get medianGbp => _medianGbp ?? 0.0;
  set medianGbp(double? val) => _medianGbp = val;
  bool hasMedianGbp() => _medianGbp != null;

  double? _medianChf;
  double get medianChf => _medianChf ?? 0.0;
  set medianChf(double? val) => _medianChf = val;
  bool hasMedianChf() => _medianChf != null;

  double? _medianSgd;
  double get medianSgd => _medianSgd ?? 0.0;
  set medianSgd(double? val) => _medianSgd = val;
  bool hasMedianSgd() => _medianSgd != null;

  static MediansStruct fromMap(Map<String, dynamic> data) => MediansStruct(
        medianUsd: (data['medianUsd'] as num?)?.toDouble(),
        medianHkd: (data['medianHkd'] as num?)?.toDouble(),
        medianEur: (data['medianEur'] as num?)?.toDouble(),
        medianGbp: (data['medianGbp'] as num?)?.toDouble(),
        medianChf: (data['medianChf'] as num?)?.toDouble(),
        medianSgd: (data['medianSgd'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'medianUsd': _medianUsd,
        'medianHkd': _medianHkd,
        'medianEur': _medianEur,
        'medianGbp': _medianGbp,
        'medianChf': _medianChf,
        'medianSgd': _medianSgd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
}

class CurrentValueStruct extends BaseStruct {
  CurrentValueStruct({
    double? netPayableUsd,
    double? netPayableSgd,
    double? netPayableHkd,
    double? netPayableGbp,
    double? netPayableEur,
    double? netPayableChf,
  })  : _netPayableUsd = netPayableUsd,
        _netPayableSgd = netPayableSgd,
        _netPayableHkd = netPayableHkd,
        _netPayableGbp = netPayableGbp,
        _netPayableEur = netPayableEur,
        _netPayableChf = netPayableChf;

  double? _netPayableUsd;
  double get netPayableUsd => _netPayableUsd ?? 0.0;
  set netPayableUsd(double? val) => _netPayableUsd = val;
  bool hasNetPayableUsd() => _netPayableUsd != null;

  double? _netPayableSgd;
  double get netPayableSgd => _netPayableSgd ?? 0.0;
  set netPayableSgd(double? val) => _netPayableSgd = val;
  bool hasNetPayableSgd() => _netPayableSgd != null;

  double? _netPayableHkd;
  double get netPayableHkd => _netPayableHkd ?? 0.0;
  set netPayableHkd(double? val) => _netPayableHkd = val;
  bool hasNetPayableHkd() => _netPayableHkd != null;

  double? _netPayableGbp;
  double get netPayableGbp => _netPayableGbp ?? 0.0;
  set netPayableGbp(double? val) => _netPayableGbp = val;
  bool hasNetPayableGbp() => _netPayableGbp != null;

  double? _netPayableEur;
  double get netPayableEur => _netPayableEur ?? 0.0;
  set netPayableEur(double? val) => _netPayableEur = val;
  bool hasNetPayableEur() => _netPayableEur != null;

  double? _netPayableChf;
  double get netPayableChf => _netPayableChf ?? 0.0;
  set netPayableChf(double? val) => _netPayableChf = val;
  bool hasNetPayableChf() => _netPayableChf != null;

  static CurrentValueStruct fromMap(Map<String, dynamic> data) =>
      CurrentValueStruct(
        netPayableUsd: (data['netPayableUsd'] as num?)?.toDouble(),
        netPayableSgd: (data['netPayableSgd'] as num?)?.toDouble(),
        netPayableHkd: (data['netPayableHkd'] as num?)?.toDouble(),
        netPayableGbp: (data['netPayableGbp'] as num?)?.toDouble(),
        netPayableEur: (data['netPayableEur'] as num?)?.toDouble(),
        netPayableChf: (data['netPayableChf'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'netPayableUsd': _netPayableUsd,
        'netPayableSgd': _netPayableSgd,
        'netPayableHkd': _netPayableHkd,
        'netPayableGbp': _netPayableGbp,
        'netPayableEur': _netPayableEur,
        'netPayableChf': _netPayableChf,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
}

class MedianPricesStruct extends BaseStruct {
  MedianPricesStruct({
    this.medianUsd = 0,
    this.medianHkd = 0,
    this.medianEur = 0,
    this.medianGbp = 0,
    this.medianChf = 0,
    this.medianSgd = 0,
  });

  final double medianUsd;
  final double medianHkd;
  final double medianEur;
  final double medianGbp;
  final double medianChf;
  final double medianSgd;

  static MedianPricesStruct fromMap(Map<String, dynamic> data) =>
      MedianPricesStruct(
        medianUsd: (data['medianUsd'] as num?)?.toDouble() ?? 0.0,
        medianHkd: (data['medianHkd'] as num?)?.toDouble() ?? 0.0,
        medianEur: (data['medianEur'] as num?)?.toDouble() ?? 0.0,
        medianGbp: (data['medianGbp'] as num?)?.toDouble() ?? 0.0,
        medianChf: (data['medianChf'] as num?)?.toDouble() ?? 0.0,
        medianSgd: (data['medianSgd'] as num?)?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toMap() => {
        'medianUsd': medianUsd,
        'medianHkd': medianHkd,
        'medianEur': medianEur,
        'medianGbp': medianGbp,
        'medianChf': medianChf,
        'medianSgd': medianSgd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
}

class AuctionAnalysisMedianStruct extends BaseStruct {
  AuctionAnalysisMedianStruct({
    required this.timeRange,
    required this.medians,
  });

  final String timeRange;
  final MedianPricesStruct medians;

  static AuctionAnalysisMedianStruct fromMap(Map<String, dynamic> data) =>
      AuctionAnalysisMedianStruct(
        timeRange: data['timeRange'] as String,
        medians:
            MedianPricesStruct.fromMap(data['medians'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'timeRange': timeRange,
        'medians': medians.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
}

class PriceAnalysisGraphStruct extends BaseStruct {
  PriceAnalysisGraphStruct({
    this.auctionPriceAnalysis = const [],
    this.dealersPriceAnalysis = const [],
    this.auctionAnalysisMedians = const [],
  });

  final List<AuctionPriceAnalysisStruct> auctionPriceAnalysis;
  final List<DealerPriceAnalysisStruct> dealersPriceAnalysis;
  final List<AuctionAnalysisMedianStruct> auctionAnalysisMedians;

  static PriceAnalysisGraphStruct fromMap(Map<String, dynamic> data) =>
      PriceAnalysisGraphStruct(
        auctionPriceAnalysis: List<AuctionPriceAnalysisStruct>.from(
            (data['auctionPriceAnalysis'] as List)
                .map((x) => AuctionPriceAnalysisStruct.fromMap(x))),
        dealersPriceAnalysis: List<DealerPriceAnalysisStruct>.from(
            (data['dealersPriceAnalysis'] as List)
                .map((x) => DealerPriceAnalysisStruct.fromMap(x))),
        auctionAnalysisMedians: List<AuctionAnalysisMedianStruct>.from(
            (data['auctionAnalysisMedians'] as List)
                .map((x) => AuctionAnalysisMedianStruct.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'auctionPriceAnalysis':
            auctionPriceAnalysis.map((e) => e.toMap()).toList(),
        'dealersPriceAnalysis':
            dealersPriceAnalysis.map((e) => e.toMap()).toList(),
        'auctionAnalysisMedians':
            auctionAnalysisMedians.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
}
