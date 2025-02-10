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
    List<AuctionPriceAnalysisStruct>? auctionPriceAnalysis,
  })  : _dealersPriceAnalysis = dealersPriceAnalysis,
        _currentValueAllCurrencies = currentValueAllCurrencies,
        _firstValueAllCurrencies = firstValueAllCurrencies,
        _priceAnalysisGraph = priceAnalysisGraph,
        _auctionAnalysisMedians = auctionAnalysisMedians,
        _auctionPriceAnalysis = auctionPriceAnalysis;

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

  List<AuctionPriceAnalysisStruct>? _auctionPriceAnalysis;
  List<AuctionPriceAnalysisStruct> get auctionPriceAnalysis =>
      _auctionPriceAnalysis ?? [];
  set auctionPriceAnalysis(List<AuctionPriceAnalysisStruct>? val) =>
      _auctionPriceAnalysis = val;

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
      auctionPriceAnalysis: (data['auctionPriceAnalysis'] as List?)
          ?.map((e) => AuctionPriceAnalysisStruct.fromMap(e))
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
        'auctionPriceAnalysis':
            _auctionPriceAnalysis?.map((e) => e.toMap()).toList(),
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
        'auctionPriceAnalysis':
            serializeParam(_auctionPriceAnalysis, ParamType.DataStruct),
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

// Function to get the highest dealer price from dealersMedians
double getHighestDealerPrice(List<DealerPriceAnalysisStruct>? dealersMedians) {
  if (dealersMedians == null || dealersMedians.isEmpty) {
    return 0.0; // Return 0 if there are no dealers
  }

  double highestPrice = 0.0;

  for (var dealer in dealersMedians) {
    // Assuming medians is a property of DealerPriceAnalysisStruct
    double dealerMedianPrice = dealer
        .medians.medianUsd; // Change this if the property name is different
    if (dealerMedianPrice > highestPrice) {
      highestPrice = dealerMedianPrice;
    }
  }

  return highestPrice;
}

// Function to get the lowest dealer price from dealersMedians
double getLowestDealerPrice(List<DealerPriceAnalysisStruct>? dealersMedians) {
  if (dealersMedians == null || dealersMedians.isEmpty) {
    return 0.0; // Return 0 if there are no dealers
  }

  double lowestPrice = double.infinity; // Start with the highest possible value
  bool hasValidPrice = false; // Flag to check if we have any valid prices

  for (var dealer in dealersMedians) {
    // Ensure that the medians property exists and is not null
    double dealerMedianPrice =
        dealer.medians.medianUsd; // Ensure this property exists

    // Only compare if the dealer median price is greater than zero
    if (dealerMedianPrice > 0) {
      hasValidPrice = true; // We found at least one valid price
      if (dealerMedianPrice < lowestPrice) {
        lowestPrice = dealerMedianPrice;
      }
    }
  }

  // If no valid prices were found, return 0
  return hasValidPrice
      ? lowestPrice
      : 0.0; // Return the lowest price or 0 if all were zero
}

double getHighestAuctionMedianPrice(
    List<AuctionAnalysisMedianStruct>? auctionAnalysisMedians) {
  if (auctionAnalysisMedians == null || auctionAnalysisMedians.isEmpty) {
    return 0.0; // Return 0 if there are no dealers
  }

  double highestPrice = 0.0;

  for (var auction in auctionAnalysisMedians) {
    // Assuming medians is a property of DealerPriceAnalysisStruct
    double auctionMedianPrice = auction
        .medians.medianUsd; // Change this if the property name is different
    if (auctionMedianPrice > highestPrice) {
      highestPrice = auctionMedianPrice;
    }
  }

  return highestPrice;
}

double getHighestAuctionPrice(
    List<AuctionPriceAnalysisStruct> auctionPriceAnalysis) {
  // Filter the auctionPriceAnalysis to include only those with lotStatusId == 2
  var filteredPrices =
      auctionPriceAnalysis.where((item) => item.lotStatusId == 2);

  // Check if the filtered list is empty
  if (filteredPrices.isEmpty) return 0.0;

  // Find the maximum netPayableUsd value
  return filteredPrices
      .map((item) => item.netPayableUsd)
      .reduce((a, b) => a > b ? a : b);
}

double getLowestAuctionPrice(
    List<AuctionPriceAnalysisStruct> auctionPriceAnalysis) {
  // Filter the auctionPriceAnalysis to include only those with lotStatusId == 2
  var filteredPrices =
      auctionPriceAnalysis.where((item) => item.lotStatusId == 2);

  // Check if the filtered list is empty
  if (filteredPrices.isEmpty) return 0.0;

  // Find the minimum netPayableUsd value
  return filteredPrices
      .map((item) => item.netPayableUsd)
      .reduce((a, b) => a < b ? a : b);
}

class AuctionPriceAnalysisStruct extends BaseStruct {
  final int watchId;
  final DateTime eventPublishEndDate;
  final String slug;
  final String modelSlug;
  final String manufacturerSlug;
  final double netPayableUsd;
  final double netPayableSgd;
  final double netPayableHkd;
  final double netPayableGbp;
  final double netPayableEur;
  final double netPayableChf;
  final double? netPayableAed;
  final double? netPayableJpy;
  final int referenceNumberId;
  final int modelId;
  final int manufacturerId;
  final String manufactureName;
  final String modelName;
  final String referenceNumber;
  final PrimaryImage? primaryImage;
  final int lotStatusId;
  final String infoSourceName;

  AuctionPriceAnalysisStruct({
    required this.watchId,
    required this.eventPublishEndDate,
    required this.slug,
    required this.modelSlug,
    required this.manufacturerSlug,
    required this.netPayableUsd,
    required this.netPayableSgd,
    required this.netPayableHkd,
    required this.netPayableGbp,
    required this.netPayableEur,
    required this.netPayableChf,
    this.netPayableAed,
    this.netPayableJpy,
    required this.referenceNumberId,
    required this.modelId,
    required this.manufacturerId,
    required this.manufactureName,
    required this.modelName,
    required this.referenceNumber,
    this.primaryImage,
    required this.lotStatusId,
    required this.infoSourceName,
  });

  factory AuctionPriceAnalysisStruct.fromMap(Map<String, dynamic> map) {
    return AuctionPriceAnalysisStruct(
      watchId: map['watchId'],
      eventPublishEndDate: DateTime.parse(map['eventPublishEndDate']),
      slug: map['slug'],
      modelSlug: map['modelSlug'],
      manufacturerSlug: map['manufacturerSlug'],
      netPayableUsd: map['netPayableUsd'].toDouble(),
      netPayableSgd: map['netPayableSgd'].toDouble(),
      netPayableHkd: map['netPayableHkd'].toDouble(),
      netPayableGbp: map['netPayableGbp'].toDouble(),
      netPayableEur: map['netPayableEur'].toDouble(),
      netPayableChf: map['netPayableChf'].toDouble(),
      netPayableAed: map['netPayableAed']?.toDouble(),
      netPayableJpy: map['netPayableJpy']?.toDouble(),
      referenceNumberId: map['referenceNumberId'],
      modelId: map['modelId'],
      manufacturerId: map['manufacturerId'],
      manufactureName: map['manufactureName'],
      modelName: map['modelName'],
      referenceNumber: map['referenceNumber'],
      primaryImage: map['primaryImage'] != null
          ? PrimaryImage.fromMap(map['primaryImage'])
          : null,
      lotStatusId: map['lotStatusId'],
      infoSourceName: map['infoSourceName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'watchId': watchId,
      'eventPublishEndDate': eventPublishEndDate.toIso8601String(),
      'slug': slug,
      'modelSlug': modelSlug,
      'manufacturerSlug': manufacturerSlug,
      'netPayableUsd': netPayableUsd,
      'netPayableSgd': netPayableSgd,
      'netPayableHkd': netPayableHkd,
      'netPayableGbp': netPayableGbp,
      'netPayableEur': netPayableEur,
      'netPayableChf': netPayableChf,
      'netPayableAed': netPayableAed,
      'netPayableJpy': netPayableJpy,
      'referenceNumberId': referenceNumberId,
      'modelId': modelId,
      'manufacturerId': manufacturerId,
      'manufactureName': manufactureName,
      'modelName': modelName,
      'referenceNumber': referenceNumber,
      'primaryImage': primaryImage?.toMap(),
      'lotStatusId': lotStatusId,
      'infoSourceName': infoSourceName,
    };
  }

  @override
  Map<String, dynamic> toSerializableMap() {
    return {
      'watchId': watchId,
      'eventPublishEndDate': eventPublishEndDate.toIso8601String(),
      'slug': slug,
      'modelSlug': modelSlug,
      'manufacturerSlug': manufacturerSlug,
      'netPayableUsd': netPayableUsd,
      'netPayableSgd': netPayableSgd,
      'netPayableHkd': netPayableHkd,
      'netPayableGbp': netPayableGbp,
      'netPayableEur': netPayableEur,
      'netPayableChf': netPayableChf,
      'netPayableAed': netPayableAed,
      'netPayableJpy': netPayableJpy,
      'referenceNumberId': referenceNumberId,
      'modelId': modelId,
      'manufacturerId': manufacturerId,
      'manufactureName': manufactureName,
      'modelName': modelName,
      'referenceNumber': referenceNumber,
      'primaryImage': primaryImage?.toSerializableMap(),
      'lotStatusId': lotStatusId,
      'infoSourceName': infoSourceName,
    };
  }
}

class PrimaryImage {
  final String url;
  final String previewEmail320;
  final String preview320;
  final String preview480;
  final String preview768;
  final String preview960;
  final String preview1366;
  final String original;
  final bool? isPrimary;
  final bool? isDeleted;

  PrimaryImage({
    required this.url,
    required this.previewEmail320,
    required this.preview320,
    required this.preview480,
    required this.preview768,
    required this.preview960,
    required this.preview1366,
    required this.original,
    this.isPrimary,
    this.isDeleted,
  });

  factory PrimaryImage.fromMap(Map<String, dynamic> map) {
    return PrimaryImage(
      url: map['url'],
      previewEmail320: map['previewEmail320'],
      preview320: map['preview320'],
      preview480: map['preview480'],
      preview768: map['preview768'],
      preview960: map['preview960'],
      preview1366: map['preview1366'],
      original: map['original'],
      isPrimary: map['isPrimary'],
      isDeleted: map['isDeleted'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'previewEmail320': previewEmail320,
      'preview320': preview320,
      'preview480': preview480,
      'preview768': preview768,
      'preview960': preview960,
      'preview1366': preview1366,
      'original': original,
      'isPrimary': isPrimary,
      'isDeleted': isDeleted,
    };
  }

  Map<String, dynamic> toSerializableMap() {
    return {
      'url': url,
      'previewEmail320': previewEmail320,
      'preview320': preview320,
      'preview480': preview480,
      'preview768': preview768,
      'preview960': preview960,
      'preview1366': preview1366,
      'original': original,
      'isPrimary': isPrimary,
      'isDeleted': isDeleted,
    };
  }
}
