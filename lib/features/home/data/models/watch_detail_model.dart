import 'package:every_watch/core/common/entities/watch_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watch_detail_model.g.dart';

@JsonSerializable()
class WatchDetailModel extends WatchDetailEntity {
  WatchDetailModel({
    required super.watchId,
    required super.manufacturerName,
    required super.modelName,
    required super.referenceNumber,
    required super.primaryImageUrl,
    required super.caseMaterial,
    required super.bezelMaterial,
    required super.movementType,
    required super.dialColor,
    required super.braceletMaterial,
    required super.yearOfProduction,
    required super.condition,
    required super.country,
    required super.auctionTitle,
    required super.auctionDate,
    required super.lotNumber,
    required super.lotStatus,
    required super.sourceLink,
    required super.eventCity,
    required super.eventCountry,
    required super.eventSlug,
    required super.organizationName,
    required super.organizationSlug,
    required super.description,
    required super.movementNo,
    required super.isBoxIncluded,
    required super.isPaperIncluded,
  });

  factory WatchDetailModel.fromJson(Map<String, dynamic> json) =>
      _$WatchDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchDetailModelToJson(this);
}
