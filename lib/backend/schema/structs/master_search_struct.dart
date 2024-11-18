// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasterSearchStruct extends BaseStruct {
  MasterSearchStruct({
    String? filters,
    String? slug,
    String? matchingString,
  })  : _filters = filters,
        _slug = slug,
        _matchingString = matchingString;

  // "filters" field.
  String? _filters;
  String get filters => _filters ?? '';
  set filters(String? val) => _filters = val;

  bool hasValue() => _filters != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  set slug(String? val) => _slug = val;

  bool hasSlug() => _slug != null;

  // "matchingString" field.
  String? _matchingString;
  String get matchingString => _matchingString ?? '';
  set matchingString(String? val) => _matchingString = val;

  bool hasMatchingString() => _matchingString != null;

  static MasterSearchStruct fromMap(Map<String, dynamic> data) =>
      MasterSearchStruct(
        filters: data['filters'] as String?,
        slug: data['slug'] as String?,
        matchingString: data['matchingString'] as String?,
      );

  static MasterSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'filters': _filters,
        'slug': _slug,
        'matchingString': _matchingString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'filters': serializeParam(_filters, ParamType.String),
        'slug': serializeParam(_slug, ParamType.String),
        'matchingString': serializeParam(_matchingString, ParamType.String),
      }.withoutNulls;

  static MasterSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      MasterSearchStruct(
        filters: deserializeParam(data['filters'], ParamType.String, false),
        slug: deserializeParam(data['slug'], ParamType.String, false),
        matchingString:
            deserializeParam(data['matchingString'], ParamType.String, false),
      );

  @override
  String toString() => 'MasterSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterSearchStruct &&
        filters == other.filters &&
        slug == other.slug &&
        matchingString == other.matchingString;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([filters, slug, matchingString]);
}

MasterSearchStruct createMasterSearchStruct({
  String? filters,
  String? slug,
  String? matchingString,
}) =>
    MasterSearchStruct(
        filters: filters, slug: slug, matchingString: matchingString);
