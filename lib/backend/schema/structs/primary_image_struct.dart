// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrimaryImageStruct extends BaseStruct {
  PrimaryImageStruct({
    String? url,
    bool? isPrimary,
    bool? isDeleted,
    String? original,
    String? preview320,
    String? preview480,
    String? preview768,
    String? preview960,
    String? preview1366,
    String? previewEmail320,
  })  : _url = url,
        _isPrimary = isPrimary,
        _isDeleted = isDeleted,
        _original = original,
        _preview320 = preview320,
        _preview480 = preview480,
        _preview768 = preview768,
        _preview960 = preview960,
        _preview1366 = preview1366,
        _previewEmail320 = previewEmail320;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "isPrimary" field.
  bool? _isPrimary;
  bool get isPrimary => _isPrimary ?? false;
  set isPrimary(bool? val) => _isPrimary = val;

  bool hasIsPrimary() => _isPrimary != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "original" field.
  String? _original;
  String get original => _original ?? '';
  set original(String? val) => _original = val;

  bool hasOriginal() => _original != null;

  // "preview320" field.
  String? _preview320;
  String get preview320 => _preview320 ?? '';
  set preview320(String? val) => _preview320 = val;

  bool hasPreview320() => _preview320 != null;

  // "preview480" field.
  String? _preview480;
  String get preview480 => _preview480 ?? '';
  set preview480(String? val) => _preview480 = val;

  bool hasPreview480() => _preview480 != null;

  // "preview768" field.
  String? _preview768;
  String get preview768 => _preview768 ?? '';
  set preview768(String? val) => _preview768 = val;

  bool hasPreview768() => _preview768 != null;

  // "preview960" field.
  String? _preview960;
  String get preview960 => _preview960 ?? '';
  set preview960(String? val) => _preview960 = val;

  bool hasPreview960() => _preview960 != null;

  // "preview1366" field.
  String? _preview1366;
  String get preview1366 => _preview1366 ?? '';
  set preview1366(String? val) => _preview1366 = val;

  bool hasPreview1366() => _preview1366 != null;

  // "previewEmail320" field.
  String? _previewEmail320;
  String get previewEmail320 => _previewEmail320 ?? '';
  set previewEmail320(String? val) => _previewEmail320 = val;

  bool hasPreviewEmail320() => _previewEmail320 != null;

  static PrimaryImageStruct fromMap(Map<String, dynamic> data) =>
      PrimaryImageStruct(
        url: data['url'] as String?,
        isPrimary: data['isPrimary'] as bool?,
        isDeleted: data['isDeleted'] as bool?,
        original: data['original'] as String?,
        preview320: data['preview320'] as String?,
        preview480: data['preview480'] as String?,
        preview768: data['preview768'] as String?,
        preview960: data['preview960'] as String?,
        preview1366: data['preview1366'] as String?,
        previewEmail320: data['previewEmail320'] as String?,
      );

  static PrimaryImageStruct? maybeFromMap(dynamic data) => data is Map
      ? PrimaryImageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'isPrimary': _isPrimary,
        'isDeleted': _isDeleted,
        'original': _original,
        'preview320': _preview320,
        'preview480': _preview480,
        'preview768': _preview768,
        'preview960': _preview960,
        'preview1366': _preview1366,
        'previewEmail320': _previewEmail320,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'isPrimary': serializeParam(
          _isPrimary,
          ParamType.String,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.String,
        ),
        'original': serializeParam(
          _original,
          ParamType.String,
        ),
        'preview320': serializeParam(
          _preview320,
          ParamType.String,
        ),
        'preview480': serializeParam(
          _preview480,
          ParamType.String,
        ),
        'preview768': serializeParam(
          _preview768,
          ParamType.String,
        ),
        'preview960': serializeParam(
          _preview960,
          ParamType.String,
        ),
        'preview1366': serializeParam(
          _preview1366,
          ParamType.String,
        ),
        'previewEmail320': serializeParam(
          _previewEmail320,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrimaryImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrimaryImageStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        isPrimary: deserializeParam(
          data['isPrimary'],
          ParamType.String,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.String,
          false,
        ),
        original: deserializeParam(
          data['original'],
          ParamType.String,
          false,
        ),
        preview320: deserializeParam(
          data['preview320'],
          ParamType.String,
          false,
        ),
        preview480: deserializeParam(
          data['preview480'],
          ParamType.String,
          false,
        ),
        preview768: deserializeParam(
          data['preview768'],
          ParamType.String,
          false,
        ),
        preview960: deserializeParam(
          data['preview960'],
          ParamType.String,
          false,
        ),
        preview1366: deserializeParam(
          data['preview1366'],
          ParamType.String,
          false,
        ),
        previewEmail320: deserializeParam(
          data['previewEmail320'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PrimaryImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrimaryImageStruct &&
        url == other.url &&
        isPrimary == other.isPrimary &&
        isDeleted == other.isDeleted &&
        original == other.original &&
        preview320 == other.preview320 &&
        preview480 == other.preview480 &&
        preview768 == other.preview768 &&
        preview960 == other.preview960 &&
        preview1366 == other.preview1366 &&
        previewEmail320 == other.previewEmail320;
  }

  @override
  int get hashCode => const ListEquality().hash([
        url,
        isPrimary,
        isDeleted,
        original,
        preview320,
        preview480,
        preview768,
        preview960,
        preview1366,
        previewEmail320
      ]);
}

PrimaryImageStruct createPrimaryImageStruct({
  String? url,
  bool? isPrimary,
  bool? isDeleted,
  String? original,
  String? preview320,
  String? preview480,
  String? preview768,
  String? preview960,
  String? preview1366,
  String? previewEmail320,
}) =>
    PrimaryImageStruct(
      url: url,
      isPrimary: isPrimary,
      isDeleted: isDeleted,
      original: original,
      preview320: preview320,
      preview480: preview480,
      preview768: preview768,
      preview960: preview960,
      preview1366: preview1366,
      previewEmail320: previewEmail320,
    );
