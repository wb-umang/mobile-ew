// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:every_watch/core/common/entities/watch_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watch_detail_model.g.dart';

@JsonSerializable()
class WatchDetailModel extends WatchDetailEntity {
  WatchDetailModel({
    super.id,
    super.watchId,
    super.auctionLotType,
    super.manufacturerId,
    super.manufactureName,
    super.manufacturerSlug,
    super.defaultManufacturerId,
    super.defaultManufacturerName,
    super.modelId,
    super.modelName,
    super.modelSlug,
    super.defaultModelId,
    super.defaultModelName,
    super.referenceNumberId,
    super.referenceNumber,
    super.defaultReferenceNumberId,
    super.defaultReferenceNumberName,
    super.primaryImage,
    super.sourceLink,
    super.caseMaterialId,
    super.caseMaterialName,
    super.defaultCaseMaterialId,
    super.defaultCaseMaterialName,
    super.movementName,
    super.box,
    super.isBox,
    super.paper,
    super.isPaper,
    super.caseSizeId,
    super.caseSizeName,
    super.yearOfProduction,
    super.conditionName,
    super.countryName,
    super.countryCode,
    super.eventPublishTitle,
    super.eventPublishEndDate,
    super.eventSlug,
    super.eventCountryName,
    super.eventCityName,
    super.organizationName,
    super.organizationId,
    super.organizationSlug,
    super.infoSourceSlug,
    super.infoSourceId,
    super.infoSourceName,
    super.eventTypeId,
    super.minEstUsd,
    super.maxEstUsd,
    super.netPayableUsd,
    super.netPayableSgd,
    super.netPayableHkd,
    super.netPayableGbp,
    super.netPayableEur,
    super.netPayableChf,
    super.netPayableAed,
    super.netPayableJpy,
    super.buyersPremiumRate,
    super.isBuyersPremiumIncluded,
    super.lotStatusId,
    super.slug,
    super.certificationId,
  });

  factory WatchDetailModel.fromJson(Map<String, dynamic> json) =>
      _$WatchDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchDetailModelToJson(this);
}
