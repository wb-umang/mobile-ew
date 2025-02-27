// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_listing_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchListingFilterModel _$WatchListingFilterModelFromJson(
        Map<String, dynamic> json) =>
    WatchListingFilterModel(
      filterData: json['filterData'] as Map<String, dynamic>,
      sortType: json['sortType'] as String,
      sortColumn: json['sortColumn'] as String,
      from: (json['from'] as num).toInt(),
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$WatchListingFilterModelToJson(
        WatchListingFilterModel instance) =>
    <String, dynamic>{
      'filterData': instance.filterData,
      'sortType': instance.sortType,
      'sortColumn': instance.sortColumn,
      'from': instance.from,
      'size': instance.size,
    };
