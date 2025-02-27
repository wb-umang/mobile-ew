// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchDetailModel _$WatchDetailModelFromJson(Map<String, dynamic> json) =>
    WatchDetailModel(
      id: (json['id'] as num?)?.toInt(),
      watchId: (json['watchId'] as num?)?.toInt(),
      auctionLotType: json['auctionLotType'] as String?,
      manufacturerId: (json['manufacturerId'] as num?)?.toInt(),
      manufactureName: json['manufactureName'] as String?,
      manufacturerSlug: json['manufacturerSlug'] as String?,
      defaultManufacturerId: (json['defaultManufacturerId'] as num?)?.toInt(),
      defaultManufacturerName: json['defaultManufacturerName'] as String?,
      modelId: (json['modelId'] as num?)?.toInt(),
      modelName: json['modelName'] as String?,
      modelSlug: json['modelSlug'] as String?,
      defaultModelId: (json['defaultModelId'] as num?)?.toInt(),
      defaultModelName: json['defaultModelName'] as String?,
      referenceNumberId: (json['referenceNumberId'] as num?)?.toInt(),
      referenceNumber: json['referenceNumber'] as String?,
      defaultReferenceNumberId:
          (json['defaultReferenceNumberId'] as num?)?.toInt(),
      defaultReferenceNumberName: json['defaultReferenceNumberName'] as String?,
      primaryImage: json['primaryImage'] == null
          ? null
          : PrimaryImage.fromJson(json['primaryImage'] as Map<String, dynamic>),
      sourceLink: json['sourceLink'] as String?,
      caseMaterialId: json['caseMaterialId'] as String?,
      caseMaterialName: json['caseMaterialName'] as String?,
      defaultCaseMaterialId: json['defaultCaseMaterialId'] as String?,
      defaultCaseMaterialName: json['defaultCaseMaterialName'] as String?,
      movementName: json['movementName'] as String?,
      box: json['box'] as String?,
      isBox: json['isBox'] as bool?,
      paper: json['paper'] as String?,
      isPaper: json['isPaper'] as bool?,
      caseSizeId: (json['caseSizeId'] as num?)?.toInt(),
      caseSizeName: json['caseSizeName'] as String?,
      yearOfProduction: (json['yearOfProduction'] as num?)?.toInt(),
      conditionName: json['conditionName'] as String?,
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String?,
      eventPublishTitle: json['eventPublishTitle'] as String?,
      eventPublishEndDate: json['eventPublishEndDate'] as String?,
      eventSlug: json['eventSlug'] as String?,
      eventCountryName: json['eventCountryName'] as String?,
      eventCityName: json['eventCityName'] as String?,
      organizationName: json['organizationName'] as String?,
      organizationId: (json['organizationId'] as num?)?.toInt(),
      organizationSlug: json['organizationSlug'] as String?,
      infoSourceSlug: json['infoSourceSlug'] as String?,
      infoSourceId: (json['infoSourceId'] as num?)?.toInt(),
      infoSourceName: json['infoSourceName'] as String?,
      eventTypeId: (json['eventTypeId'] as num?)?.toInt(),
      minEstUsd: (json['minEstUsd'] as num?)?.toInt(),
      maxEstUsd: (json['maxEstUsd'] as num?)?.toInt(),
      netPayableUsd: (json['netPayableUsd'] as num?)?.toInt(),
      netPayableSgd: (json['netPayableSgd'] as num?)?.toInt(),
      netPayableHkd: (json['netPayableHkd'] as num?)?.toInt(),
      netPayableGbp: (json['netPayableGbp'] as num?)?.toInt(),
      netPayableEur: (json['netPayableEur'] as num?)?.toInt(),
      netPayableChf: (json['netPayableChf'] as num?)?.toInt(),
      netPayableAed: (json['netPayableAed'] as num?)?.toInt(),
      netPayableJpy: (json['netPayableJpy'] as num?)?.toInt(),
      buyersPremiumRate: (json['buyersPremiumRate'] as num?)?.toInt(),
      isBuyersPremiumIncluded: json['isBuyersPremiumIncluded'] as bool?,
      lotStatusId: (json['lotStatusId'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      certificationId: (json['certificationId'] as num?)?.toInt(),
    )
      ..imageSimilarityScore = json['imageSimilarityScore']
      ..manufacturerParentId = json['manufacturerParentId']
      ..isActiveManufacturer = json['isActiveManufacturer']
      ..manufacturerURL = json['manufacturerURL']
      ..manufacturerPriority = json['manufacturerPriority']
      ..modelParentId = json['modelParentId']
      ..isActiveModel = json['isActiveModel']
      ..modelURL = json['modelURL']
      ..modelPriority = json['modelPriority']
      ..referenceParentId = json['referenceParentId']
      ..isActiveReferenceNumber = json['isActiveReferenceNumber']
      ..referenceNumberSlug = json['referenceNumberSlug']
      ..referenceNumberURL = json['referenceNumberURL']
      ..referenceNumberIsPending = json['referenceNumberIsPending']
      ..defaultReferenceNumberParentId = json['defaultReferenceNumberParentId']
      ..defaultReferenceNumberParentName =
          json['defaultReferenceNumberParentName']
      ..imageUrl = json['imageUrl']
      ..watchImages = json['watchImages']
      ..description = json['description']
      ..descriptionHtml = json['descriptionHtml']
      ..watchTitle = json['watchTitle']
      ..catelogNotes = json['catelogNotes']
      ..notes = json['notes']
      ..dimension = json['dimension']
      ..currencyName = json['currencyName']
      ..caseMaterialParentId = json['caseMaterialParentId']
      ..isActiveCaseMaterial = json['isActiveCaseMaterial']
      ..bezelMaterialId = json['bezelMaterialId']
      ..bezelMaterialName = json['bezelMaterialName']
      ..bezelMaterialParentId = json['bezelMaterialParentId']
      ..isActiveBezelMaterial = json['isActiveBezelMaterial']
      ..defaultBezelMaterialId = json['defaultBezelMaterialId']
      ..defaultBezelMaterialName = json['defaultBezelMaterialName']
      ..functionId = json['functionId']
      ..functionName = json['functionName']
      ..functionParentId = json['functionParentId']
      ..isActiveFunction = json['isActiveFunction']
      ..defaultFunctionId = json['defaultFunctionId']
      ..defaultFunctionName = json['defaultFunctionName']
      ..movementId = json['movementId']
      ..movementParentId = json['movementParentId']
      ..isActiveMovement = json['isActiveMovement']
      ..defaultMovementId = json['defaultMovementId']
      ..defaultMovementName = json['defaultMovementName']
      ..gender = json['gender']
      ..caseSizeParentId = json['caseSizeParentId']
      ..isActiveCaseSize = json['isActiveCaseSize']
      ..defaultCaseSizeId = json['defaultCaseSizeId']
      ..defaultCaseSizeName = json['defaultCaseSizeName']
      ..yearOfProductionId = json['yearOfProductionId']
      ..yearOfProductionParentId = json['yearOfProductionParentId']
      ..isActiveYearOfProduction = json['isActiveYearOfProduction']
      ..defaultYearOfProductionId = json['defaultYearOfProductionId']
      ..defaultYearOfProductionName = json['defaultYearOfProductionName']
      ..conditionId = json['conditionId']
      ..conditionParentId = json['conditionParentId']
      ..isActiveCondition = json['isActiveCondition']
      ..defaultConditionId = json['defaultConditionId']
      ..defaultConditionName = json['defaultConditionName']
      ..isActive = json['isActive']
      ..locationId = json['locationId']
      ..currencyId = json['currencyId']
      ..price = json['price']
      ..dialColorId = json['dialColorId'] as String?
      ..dialColorName = json['dialColorName'] as String?
      ..dialColorParentId = json['dialColorParentId']
      ..isActiveDialColor = json['isActiveDialColor']
      ..defaultColorId = json['defaultColorId'] as String?
      ..defaultColorName = json['defaultColorName'] as String?
      ..braceletMaterialId = (json['braceletMaterialId'] as num?)?.toInt()
      ..braceletMaterialName = json['braceletMaterialName'] as String?
      ..braceletMaterialParentId = json['braceletMaterialParentId']
      ..isActiveBraceletMaterial = json['isActiveBraceletMaterial']
      ..defaultBraceletMaterialId =
          (json['defaultBraceletMaterialId'] as num?)?.toInt()
      ..defaultBraceletMaterialName =
          json['defaultBraceletMaterialName'] as String?
      ..claspMaterialId = json['claspMaterialId']
      ..claspMaterialName = json['claspMaterialName']
      ..claspMaterialParentId = json['claspMaterialParentId']
      ..isActiveClaspMaterial = json['isActiveClaspMaterial']
      ..defaultClaspMaterialId = json['defaultClaspMaterialId']
      ..defaultClaspMaterialName = json['defaultClaspMaterialName']
      ..auctionLotPublishId = json['auctionLotPublishId']
      ..lotId = json['lotId']
      ..lotNumber = json['lotNumber'] as String?
      ..lotNumberint = json['lotNumberint']
      ..lotSlug = json['lotSlug']
      ..movementNo = json['movementNo']
      ..eventPublishId = json['eventPublishId']
      ..eventPublishLotQuantity = json['eventPublishLotQuantity']
      ..eventPublistStartDate = json['eventPublistStartDate'] as String?
      ..eventIsDeleted = json['eventIsDeleted']
      ..isDeleted = json['isDeleted']
      ..countryId = json['countryId']
      ..countryCode2 = json['countryCode2']
      ..flagURL = json['flagURL']
      ..eventCountryId = json['eventCountryId']
      ..eventCityId = json['eventCityId']
      ..lotQuantity = json['lotQuantity']
      ..eventTypeName = json['eventTypeName']
      ..minEstHkd = (json['minEstHkd'] as num?)?.toInt()
      ..maxEstHkd = (json['maxEstHkd'] as num?)?.toInt()
      ..minEstEur = (json['minEstEur'] as num?)?.toInt()
      ..maxEstEur = (json['maxEstEur'] as num?)?.toInt()
      ..minEstGbp = (json['minEstGbp'] as num?)?.toInt()
      ..maxEstGbp = (json['maxEstGbp'] as num?)?.toInt()
      ..minEstChf = (json['minEstChf'] as num?)?.toInt()
      ..maxEstChf = (json['maxEstChf'] as num?)?.toInt()
      ..minEstSgd = (json['minEstSgd'] as num?)?.toInt()
      ..maxEstSgd = (json['maxEstSgd'] as num?)?.toInt()
      ..minEstAed = json['minEstAed']
      ..maxEstAed = json['maxEstAed']
      ..minEstJpy = json['minEstJpy']
      ..maxEstJpy = json['maxEstJpy']
      ..maximumEstimatedPrice = json['maximumEstimatedPrice']
      ..minimumEstimatedPrice = json['minimumEstimatedPrice']
      ..hammerUsd = json['hammerUsd']
      ..hammerHkd = json['hammerHkd']
      ..hammerEur = json['hammerEur']
      ..hammerGbp = json['hammerGbp']
      ..hammerChf = json['hammerChf']
      ..hammerSgd = json['hammerSgd']
      ..hammerAed = json['hammerAed']
      ..hammerJpy = json['hammerJpy']
      ..retailCurrencyId = json['retailCurrencyId']
      ..retailPrice = json['retailPrice']
      ..retailPriceUsd = json['retailPriceUsd']
      ..retailPriceSgd = json['retailPriceSgd']
      ..retailPriceHkd = json['retailPriceHkd']
      ..retailPriceGbp = json['retailPriceGbp']
      ..retailPriceEur = json['retailPriceEur']
      ..retailPriceChf = json['retailPriceChf']
      ..retailPriceAed = json['retailPriceAed']
      ..retailPriceJpy = json['retailPriceJpy']
      ..auctionIsDeleted = json['auctionIsDeleted']
      ..soldPrice = json['soldPrice']
      ..isResultPending = json['isResultPending'] as bool?
      ..lotStatusName = json['lotStatusName'] as String?
      ..curruncyForSorting = json['curruncyForSorting']
      ..createdDate = json['createdDate']
      ..updatedDate = json['updatedDate']
      ..lotPerformance = json['lotPerformance']
      ..referenceParent = json['referenceParent']
      ..nickNameId = json['nickNameId']
      ..nickName = json['nickName']
      ..nickNameParentId = json['nickNameParentId']
      ..isActiveNickName = json['isActiveNickName']
      ..defaultNickNameId = json['defaultNickNameId']
      ..defaultNickName = json['defaultNickName']
      ..sellerOrganizationName = json['sellerOrganizationName']
      ..hasImage = json['hasImage']
      ..lastSeenDate = json['lastSeenDate']
      ..watchStatus = json['watchStatus']
      ..msrp = json['msrp']
      ..watchFeatures = json['watchFeatures']
      ..imageVector = json['imageVector']
      ..daysOnMarket = json['daysOnMarket']
      ..certificationName = json['certificationName'];

Map<String, dynamic> _$WatchDetailModelToJson(WatchDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watchId': instance.watchId,
      'imageSimilarityScore': instance.imageSimilarityScore,
      'auctionLotType': instance.auctionLotType,
      'manufacturerId': instance.manufacturerId,
      'manufactureName': instance.manufactureName,
      'manufacturerParentId': instance.manufacturerParentId,
      'isActiveManufacturer': instance.isActiveManufacturer,
      'manufacturerSlug': instance.manufacturerSlug,
      'manufacturerURL': instance.manufacturerURL,
      'manufacturerPriority': instance.manufacturerPriority,
      'defaultManufacturerId': instance.defaultManufacturerId,
      'defaultManufacturerName': instance.defaultManufacturerName,
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'modelParentId': instance.modelParentId,
      'isActiveModel': instance.isActiveModel,
      'modelSlug': instance.modelSlug,
      'modelURL': instance.modelURL,
      'modelPriority': instance.modelPriority,
      'defaultModelId': instance.defaultModelId,
      'defaultModelName': instance.defaultModelName,
      'referenceNumberId': instance.referenceNumberId,
      'referenceNumber': instance.referenceNumber,
      'referenceParentId': instance.referenceParentId,
      'isActiveReferenceNumber': instance.isActiveReferenceNumber,
      'referenceNumberSlug': instance.referenceNumberSlug,
      'referenceNumberURL': instance.referenceNumberURL,
      'referenceNumberIsPending': instance.referenceNumberIsPending,
      'defaultReferenceNumberId': instance.defaultReferenceNumberId,
      'defaultReferenceNumberName': instance.defaultReferenceNumberName,
      'defaultReferenceNumberParentId': instance.defaultReferenceNumberParentId,
      'defaultReferenceNumberParentName':
          instance.defaultReferenceNumberParentName,
      'primaryImage': instance.primaryImage,
      'imageUrl': instance.imageUrl,
      'watchImages': instance.watchImages,
      'sourceLink': instance.sourceLink,
      'description': instance.description,
      'descriptionHtml': instance.descriptionHtml,
      'watchTitle': instance.watchTitle,
      'catelogNotes': instance.catelogNotes,
      'notes': instance.notes,
      'dimension': instance.dimension,
      'currencyName': instance.currencyName,
      'caseMaterialId': instance.caseMaterialId,
      'caseMaterialName': instance.caseMaterialName,
      'caseMaterialParentId': instance.caseMaterialParentId,
      'isActiveCaseMaterial': instance.isActiveCaseMaterial,
      'defaultCaseMaterialId': instance.defaultCaseMaterialId,
      'defaultCaseMaterialName': instance.defaultCaseMaterialName,
      'bezelMaterialId': instance.bezelMaterialId,
      'bezelMaterialName': instance.bezelMaterialName,
      'bezelMaterialParentId': instance.bezelMaterialParentId,
      'isActiveBezelMaterial': instance.isActiveBezelMaterial,
      'defaultBezelMaterialId': instance.defaultBezelMaterialId,
      'defaultBezelMaterialName': instance.defaultBezelMaterialName,
      'functionId': instance.functionId,
      'functionName': instance.functionName,
      'functionParentId': instance.functionParentId,
      'isActiveFunction': instance.isActiveFunction,
      'defaultFunctionId': instance.defaultFunctionId,
      'defaultFunctionName': instance.defaultFunctionName,
      'movementId': instance.movementId,
      'movementName': instance.movementName,
      'movementParentId': instance.movementParentId,
      'isActiveMovement': instance.isActiveMovement,
      'defaultMovementId': instance.defaultMovementId,
      'defaultMovementName': instance.defaultMovementName,
      'box': instance.box,
      'isBox': instance.isBox,
      'paper': instance.paper,
      'isPaper': instance.isPaper,
      'gender': instance.gender,
      'caseSizeId': instance.caseSizeId,
      'caseSizeName': instance.caseSizeName,
      'caseSizeParentId': instance.caseSizeParentId,
      'isActiveCaseSize': instance.isActiveCaseSize,
      'defaultCaseSizeId': instance.defaultCaseSizeId,
      'defaultCaseSizeName': instance.defaultCaseSizeName,
      'yearOfProductionId': instance.yearOfProductionId,
      'yearOfProduction': instance.yearOfProduction,
      'yearOfProductionParentId': instance.yearOfProductionParentId,
      'isActiveYearOfProduction': instance.isActiveYearOfProduction,
      'defaultYearOfProductionId': instance.defaultYearOfProductionId,
      'defaultYearOfProductionName': instance.defaultYearOfProductionName,
      'conditionId': instance.conditionId,
      'conditionName': instance.conditionName,
      'conditionParentId': instance.conditionParentId,
      'isActiveCondition': instance.isActiveCondition,
      'defaultConditionId': instance.defaultConditionId,
      'defaultConditionName': instance.defaultConditionName,
      'isActive': instance.isActive,
      'locationId': instance.locationId,
      'currencyId': instance.currencyId,
      'price': instance.price,
      'dialColorId': instance.dialColorId,
      'dialColorName': instance.dialColorName,
      'dialColorParentId': instance.dialColorParentId,
      'isActiveDialColor': instance.isActiveDialColor,
      'defaultColorId': instance.defaultColorId,
      'defaultColorName': instance.defaultColorName,
      'braceletMaterialId': instance.braceletMaterialId,
      'braceletMaterialName': instance.braceletMaterialName,
      'braceletMaterialParentId': instance.braceletMaterialParentId,
      'isActiveBraceletMaterial': instance.isActiveBraceletMaterial,
      'defaultBraceletMaterialId': instance.defaultBraceletMaterialId,
      'defaultBraceletMaterialName': instance.defaultBraceletMaterialName,
      'claspMaterialId': instance.claspMaterialId,
      'claspMaterialName': instance.claspMaterialName,
      'claspMaterialParentId': instance.claspMaterialParentId,
      'isActiveClaspMaterial': instance.isActiveClaspMaterial,
      'defaultClaspMaterialId': instance.defaultClaspMaterialId,
      'defaultClaspMaterialName': instance.defaultClaspMaterialName,
      'auctionLotPublishId': instance.auctionLotPublishId,
      'lotId': instance.lotId,
      'lotNumber': instance.lotNumber,
      'lotNumberint': instance.lotNumberint,
      'lotSlug': instance.lotSlug,
      'movementNo': instance.movementNo,
      'eventPublishId': instance.eventPublishId,
      'eventPublishTitle': instance.eventPublishTitle,
      'eventPublishLotQuantity': instance.eventPublishLotQuantity,
      'eventPublishEndDate': instance.eventPublishEndDate,
      'eventPublistStartDate': instance.eventPublistStartDate,
      'eventSlug': instance.eventSlug,
      'eventIsDeleted': instance.eventIsDeleted,
      'isDeleted': instance.isDeleted,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'countryCode2': instance.countryCode2,
      'flagURL': instance.flagURL,
      'eventCountryId': instance.eventCountryId,
      'eventCountryName': instance.eventCountryName,
      'eventCityId': instance.eventCityId,
      'eventCityName': instance.eventCityName,
      'organizationName': instance.organizationName,
      'organizationId': instance.organizationId,
      'lotQuantity': instance.lotQuantity,
      'organizationSlug': instance.organizationSlug,
      'infoSourceSlug': instance.infoSourceSlug,
      'infoSourceId': instance.infoSourceId,
      'infoSourceName': instance.infoSourceName,
      'eventTypeId': instance.eventTypeId,
      'eventTypeName': instance.eventTypeName,
      'minEstUsd': instance.minEstUsd,
      'maxEstUsd': instance.maxEstUsd,
      'minEstHkd': instance.minEstHkd,
      'maxEstHkd': instance.maxEstHkd,
      'minEstEur': instance.minEstEur,
      'maxEstEur': instance.maxEstEur,
      'minEstGbp': instance.minEstGbp,
      'maxEstGbp': instance.maxEstGbp,
      'minEstChf': instance.minEstChf,
      'maxEstChf': instance.maxEstChf,
      'minEstSgd': instance.minEstSgd,
      'maxEstSgd': instance.maxEstSgd,
      'minEstAed': instance.minEstAed,
      'maxEstAed': instance.maxEstAed,
      'minEstJpy': instance.minEstJpy,
      'maxEstJpy': instance.maxEstJpy,
      'maximumEstimatedPrice': instance.maximumEstimatedPrice,
      'minimumEstimatedPrice': instance.minimumEstimatedPrice,
      'hammerUsd': instance.hammerUsd,
      'hammerHkd': instance.hammerHkd,
      'hammerEur': instance.hammerEur,
      'hammerGbp': instance.hammerGbp,
      'hammerChf': instance.hammerChf,
      'hammerSgd': instance.hammerSgd,
      'hammerAed': instance.hammerAed,
      'hammerJpy': instance.hammerJpy,
      'netPayableUsd': instance.netPayableUsd,
      'netPayableSgd': instance.netPayableSgd,
      'netPayableHkd': instance.netPayableHkd,
      'netPayableGbp': instance.netPayableGbp,
      'netPayableEur': instance.netPayableEur,
      'netPayableChf': instance.netPayableChf,
      'netPayableAed': instance.netPayableAed,
      'netPayableJpy': instance.netPayableJpy,
      'retailCurrencyId': instance.retailCurrencyId,
      'retailPrice': instance.retailPrice,
      'retailPriceUsd': instance.retailPriceUsd,
      'retailPriceSgd': instance.retailPriceSgd,
      'retailPriceHkd': instance.retailPriceHkd,
      'retailPriceGbp': instance.retailPriceGbp,
      'retailPriceEur': instance.retailPriceEur,
      'retailPriceChf': instance.retailPriceChf,
      'retailPriceAed': instance.retailPriceAed,
      'retailPriceJpy': instance.retailPriceJpy,
      'buyersPremiumRate': instance.buyersPremiumRate,
      'isBuyersPremiumIncluded': instance.isBuyersPremiumIncluded,
      'auctionIsDeleted': instance.auctionIsDeleted,
      'soldPrice': instance.soldPrice,
      'isResultPending': instance.isResultPending,
      'lotStatusId': instance.lotStatusId,
      'lotStatusName': instance.lotStatusName,
      'curruncyForSorting': instance.curruncyForSorting,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'lotPerformance': instance.lotPerformance,
      'referenceParent': instance.referenceParent,
      'nickNameId': instance.nickNameId,
      'nickName': instance.nickName,
      'nickNameParentId': instance.nickNameParentId,
      'isActiveNickName': instance.isActiveNickName,
      'defaultNickNameId': instance.defaultNickNameId,
      'defaultNickName': instance.defaultNickName,
      'slug': instance.slug,
      'sellerOrganizationName': instance.sellerOrganizationName,
      'hasImage': instance.hasImage,
      'lastSeenDate': instance.lastSeenDate,
      'watchStatus': instance.watchStatus,
      'msrp': instance.msrp,
      'watchFeatures': instance.watchFeatures,
      'imageVector': instance.imageVector,
      'daysOnMarket': instance.daysOnMarket,
      'certificationId': instance.certificationId,
      'certificationName': instance.certificationName,
    };
