// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalFilterStruct extends BaseStruct {
  GlobalFilterStruct({
    dynamic id,
    String? value,
    dynamic parentId,
    int? count,
    String? slug,
  })  : _id = id,
        _value = value,
        _parentId = parentId,
        _count = count,
        _slug = slug;

  // "id" field.
  dynamic _id;
  dynamic get id =>
      _id ??
      0; // You may want to handle null values differently depending on your use case.
  set id(dynamic val) => _id = val;

  bool hasId() => _id != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "parentId" field.
  dynamic _parentId;
  dynamic get parentId => _parentId ?? 0; // Adjust null handling as needed.
  set parentId(dynamic val) => _parentId = val;

  bool hasParentId() => _parentId != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  set slug(String? val) => _slug = val;

  bool hasSlug() => _slug != null;

  static GlobalFilterStruct fromMap(Map<String, dynamic> data) =>
      GlobalFilterStruct(
        id: data['id'],
        value: data['value'] as String?,
        parentId: data['parentId'],
        count: castToType<int>(data['count']),
        slug: data['slug'] as String?,
      );

  static GlobalFilterStruct? maybeFromMap(dynamic data) => data is Map
      ? GlobalFilterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'value': _value,
        'parentId': _parentId,
        'count': _count,
        'slug': _slug,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
            _id,
            ParamType
                .int), // Make sure your serialization handles dynamic types correctly.
        'value': serializeParam(_value, ParamType.String),
        'parentId': serializeParam(_parentId, ParamType.int),
        'count': serializeParam(_count, ParamType.int),
        'slug': serializeParam(_slug, ParamType.String),
      }.withoutNulls;

  static GlobalFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      GlobalFilterStruct(
        id: deserializeParam(data['id'], ParamType.int, false),
        value: deserializeParam(data['value'], ParamType.String, false),
        parentId: deserializeParam(data['parentId'], ParamType.int, false),
        count: deserializeParam(data['count'], ParamType.int, false),
        slug: deserializeParam(data['slug'], ParamType.String, false),
      );

  @override
  String toString() => 'GlobalFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GlobalFilterStruct &&
        id == other.id &&
        value == other.value &&
        parentId == other.parentId &&
        count == other.count &&
        slug == other.slug;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, value, parentId, count, slug]);
}

GlobalFilterStruct createGlobalFilterStruct({
  dynamic id,
  String? value,
  dynamic parentId,
  int? count,
  String? slug,
}) =>
    GlobalFilterStruct(
      id: id,
      value: value,
      parentId: parentId,
      count: count,
      slug: slug,
    );
