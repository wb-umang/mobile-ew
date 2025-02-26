class WatchDetailEntity {
  final int watchId;
  final String manufacturerName;
  final String modelName;
  final String referenceNumber;
  final String primaryImageUrl;
  final String caseMaterial;
  final String bezelMaterial;
  final String movementType;
  final String dialColor;
  final String braceletMaterial;
  final int yearOfProduction;
  final String condition;
  final String country;
  final String auctionTitle;
  final String auctionDate;
  final double? minEstimateUSD;
  final double? maxEstimateUSD;
  final double? netPayableUSD;
  final double? soldPrice;
  final String lotNumber;
  final String lotStatus;
  final String sourceLink;
  final String eventCity;
  final String eventCountry;
  final String eventSlug;
  final String organizationName;
  final String organizationSlug;
  final String description;
  final String movementNo;
  final bool isBoxIncluded;
  final bool isPaperIncluded;

  const WatchDetailEntity({
    required this.watchId,
    required this.manufacturerName,
    required this.modelName,
    required this.referenceNumber,
    required this.primaryImageUrl,
    required this.caseMaterial,
    required this.bezelMaterial,
    required this.movementType,
    required this.dialColor,
    required this.braceletMaterial,
    required this.yearOfProduction,
    required this.condition,
    required this.country,
    required this.auctionTitle,
    required this.auctionDate,
    this.minEstimateUSD,
    this.maxEstimateUSD,
    this.netPayableUSD,
    this.soldPrice,
    required this.lotNumber,
    required this.lotStatus,
    required this.sourceLink,
    required this.eventCity,
    required this.eventCountry,
    required this.eventSlug,
    required this.organizationName,
    required this.organizationSlug,
    required this.description,
    required this.movementNo,
    required this.isBoxIncluded,
    required this.isPaperIncluded,
  });
}
