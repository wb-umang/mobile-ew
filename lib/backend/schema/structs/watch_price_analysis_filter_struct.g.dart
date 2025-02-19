// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_price_analysis_filter_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WatchPriceAnalysisFilterStruct extends WatchPriceAnalysisFilterStruct {
  @override
  final List<String>? auctionType;
  @override
  final List<String>? manufacturer;
  @override
  final List<String>? model;
  @override
  final List<String?>? referenceNumber;
  @override
  final List<String?>? childReferenceNumber;
  @override
  final List<String>? caseMaterial;
  @override
  final String? currencyMode;
  @override
  final String? eventDateRange;

  factory _$WatchPriceAnalysisFilterStruct(
          [void Function(WatchPriceAnalysisFilterStructBuilder)? updates]) =>
      (new WatchPriceAnalysisFilterStructBuilder()..update(updates))._build();

  _$WatchPriceAnalysisFilterStruct._(
      {this.auctionType,
      this.manufacturer,
      this.model,
      this.referenceNumber,
      this.childReferenceNumber,
      this.caseMaterial,
      this.currencyMode,
      this.eventDateRange})
      : super._();

  @override
  WatchPriceAnalysisFilterStruct rebuild(
          void Function(WatchPriceAnalysisFilterStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WatchPriceAnalysisFilterStructBuilder toBuilder() =>
      new WatchPriceAnalysisFilterStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WatchPriceAnalysisFilterStruct &&
        auctionType == other.auctionType &&
        manufacturer == other.manufacturer &&
        model == other.model &&
        referenceNumber == other.referenceNumber &&
        childReferenceNumber == other.childReferenceNumber &&
        caseMaterial == other.caseMaterial &&
        currencyMode == other.currencyMode &&
        eventDateRange == other.eventDateRange;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, auctionType.hashCode);
    _$hash = $jc(_$hash, manufacturer.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, referenceNumber.hashCode);
    _$hash = $jc(_$hash, childReferenceNumber.hashCode);
    _$hash = $jc(_$hash, caseMaterial.hashCode);
    _$hash = $jc(_$hash, currencyMode.hashCode);
    _$hash = $jc(_$hash, eventDateRange.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WatchPriceAnalysisFilterStruct')
          ..add('auctionType', auctionType)
          ..add('manufacturer', manufacturer)
          ..add('model', model)
          ..add('referenceNumber', referenceNumber)
          ..add('childReferenceNumber', childReferenceNumber)
          ..add('caseMaterial', caseMaterial)
          ..add('currencyMode', currencyMode)
          ..add('eventDateRange', eventDateRange))
        .toString();
  }
}

class WatchPriceAnalysisFilterStructBuilder
    implements
        Builder<WatchPriceAnalysisFilterStruct,
            WatchPriceAnalysisFilterStructBuilder> {
  _$WatchPriceAnalysisFilterStruct? _$v;

  List<String>? _auctionType;
  List<String>? get auctionType => _$this._auctionType;
  set auctionType(List<String>? auctionType) =>
      _$this._auctionType = auctionType;

  List<String>? _manufacturer;
  List<String>? get manufacturer => _$this._manufacturer;
  set manufacturer(List<String>? manufacturer) =>
      _$this._manufacturer = manufacturer;

  List<String>? _model;
  List<String>? get model => _$this._model;
  set model(List<String>? model) => _$this._model = model;

  List<String?>? _referenceNumber;
  List<String?>? get referenceNumber => _$this._referenceNumber;
  set referenceNumber(List<String?>? referenceNumber) =>
      _$this._referenceNumber = referenceNumber;

  List<String?>? _childReferenceNumber;
  List<String?>? get childReferenceNumber => _$this._childReferenceNumber;
  set childReferenceNumber(List<String?>? childReferenceNumber) =>
      _$this._childReferenceNumber = childReferenceNumber;

  List<String>? _caseMaterial;
  List<String>? get caseMaterial => _$this._caseMaterial;
  set caseMaterial(List<String>? caseMaterial) =>
      _$this._caseMaterial = caseMaterial;

  String? _currencyMode;
  String? get currencyMode => _$this._currencyMode;
  set currencyMode(String? currencyMode) => _$this._currencyMode = currencyMode;

  String? _eventDateRange;
  String? get eventDateRange => _$this._eventDateRange;
  set eventDateRange(String? eventDateRange) =>
      _$this._eventDateRange = eventDateRange;

  WatchPriceAnalysisFilterStructBuilder();

  WatchPriceAnalysisFilterStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auctionType = $v.auctionType;
      _manufacturer = $v.manufacturer;
      _model = $v.model;
      _referenceNumber = $v.referenceNumber;
      _childReferenceNumber = $v.childReferenceNumber;
      _caseMaterial = $v.caseMaterial;
      _currencyMode = $v.currencyMode;
      _eventDateRange = $v.eventDateRange;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WatchPriceAnalysisFilterStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WatchPriceAnalysisFilterStruct;
  }

  @override
  void update(void Function(WatchPriceAnalysisFilterStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WatchPriceAnalysisFilterStruct build() => _build();

  _$WatchPriceAnalysisFilterStruct _build() {
    final _$result = _$v ??
        new _$WatchPriceAnalysisFilterStruct._(
          auctionType: auctionType,
          manufacturer: manufacturer,
          model: model,
          referenceNumber: referenceNumber,
          childReferenceNumber: childReferenceNumber,
          caseMaterial: caseMaterial,
          currencyMode: currencyMode,
          eventDateRange: eventDateRange,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
