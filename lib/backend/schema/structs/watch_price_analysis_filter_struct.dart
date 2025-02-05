import 'package:built_value/built_value.dart';

part 'watch_price_analysis_filter_struct.g.dart';

abstract class WatchPriceAnalysisFilterStruct
    implements
        Built<WatchPriceAnalysisFilterStruct,
            WatchPriceAnalysisFilterStructBuilder> {
  List<String>? get auctionType;
  List<String>? get manufacturer;
  List<String>? get model;
  List<String>? get referenceNumber;
  List<String>? get childReferenceNumber;
  List<String>? get caseMaterial;
  String? get currencyMode;
  String? get eventDateRange;

  WatchPriceAnalysisFilterStruct._();

  factory WatchPriceAnalysisFilterStruct(
          [void Function(WatchPriceAnalysisFilterStructBuilder) updates]) =
      _$WatchPriceAnalysisFilterStruct;

  Map<String, dynamic> toMap() {
    return {
      'filterData': {
        'auctionType': auctionType,
        'manufacturer': manufacturer,
        'model': model,
        'referenceNumber': referenceNumber,
        'childReferenceNumber': childReferenceNumber,
        'caseMaterial': caseMaterial,
        'currencyMode': currencyMode,
        'eventDateRange': eventDateRange,
      }
    };
  }

  static WatchPriceAnalysisFilterStruct? fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    }
    final filterData = data['filterData'] as Map<String, dynamic>;
    return WatchPriceAnalysisFilterStruct((b) => b
      ..auctionType = (filterData['auctionType'] as List?)?.cast<String>()
      ..manufacturer = (filterData['manufacturer'] as List?)?.cast<String>()
      ..model = (filterData['model'] as List?)?.cast<String>()
      ..referenceNumber =
          (filterData['referenceNumber'] as List?)?.cast<String>()
      ..childReferenceNumber =
          (filterData['childReferenceNumber'] as List?)?.cast<String>()
      ..caseMaterial = (filterData['caseMaterial'] as List?)?.cast<String>()
      ..currencyMode = filterData['currencyMode'] as String?
      ..eventDateRange = filterData['eventDateRange'] as String?);
  }
}
