// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchDetailModel _$WatchDetailModelFromJson(Map<String, dynamic> json) =>
    WatchDetailModel(
      watchId: (json['watchId'] as num).toInt(),
      manufacturerName: json['manufacturerName'] as String,
      modelName: json['modelName'] as String,
      referenceNumber: json['referenceNumber'] as String,
      primaryImageUrl: json['primaryImageUrl'] as String,
      caseMaterial: json['caseMaterial'] as String,
      bezelMaterial: json['bezelMaterial'] as String,
      movementType: json['movementType'] as String,
      dialColor: json['dialColor'] as String,
      braceletMaterial: json['braceletMaterial'] as String,
      yearOfProduction: (json['yearOfProduction'] as num).toInt(),
      condition: json['condition'] as String,
      country: json['country'] as String,
      auctionTitle: json['auctionTitle'] as String,
      auctionDate: json['auctionDate'] as String,
      lotNumber: json['lotNumber'] as String,
      lotStatus: json['lotStatus'] as String,
      sourceLink: json['sourceLink'] as String,
      eventCity: json['eventCity'] as String,
      eventCountry: json['eventCountry'] as String,
      eventSlug: json['eventSlug'] as String,
      organizationName: json['organizationName'] as String,
      organizationSlug: json['organizationSlug'] as String,
      description: json['description'] as String,
      movementNo: json['movementNo'] as String,
      isBoxIncluded: json['isBoxIncluded'] as bool,
      isPaperIncluded: json['isPaperIncluded'] as bool,
    );

Map<String, dynamic> _$WatchDetailModelToJson(WatchDetailModel instance) =>
    <String, dynamic>{
      'watchId': instance.watchId,
      'manufacturerName': instance.manufacturerName,
      'modelName': instance.modelName,
      'referenceNumber': instance.referenceNumber,
      'primaryImageUrl': instance.primaryImageUrl,
      'caseMaterial': instance.caseMaterial,
      'bezelMaterial': instance.bezelMaterial,
      'movementType': instance.movementType,
      'dialColor': instance.dialColor,
      'braceletMaterial': instance.braceletMaterial,
      'yearOfProduction': instance.yearOfProduction,
      'condition': instance.condition,
      'country': instance.country,
      'auctionTitle': instance.auctionTitle,
      'auctionDate': instance.auctionDate,
      'lotNumber': instance.lotNumber,
      'lotStatus': instance.lotStatus,
      'sourceLink': instance.sourceLink,
      'eventCity': instance.eventCity,
      'eventCountry': instance.eventCountry,
      'eventSlug': instance.eventSlug,
      'organizationName': instance.organizationName,
      'organizationSlug': instance.organizationSlug,
      'description': instance.description,
      'movementNo': instance.movementNo,
      'isBoxIncluded': instance.isBoxIncluded,
      'isPaperIncluded': instance.isPaperIncluded,
    };
