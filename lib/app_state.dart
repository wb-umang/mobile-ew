import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_loginData')) {
        try {
          final serializedData = prefs.getString('ff_loginData') ?? '{}';
          _loginData =
              LoginDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }

      if (prefs.containsKey('ff_watchListingFilter')) {
        try {
          final serializedData =
              prefs.getString('ff_watchListingFilter') ?? '{}';
          _watchListingFilter = WatchListingFilterStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  Future<void> clear() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LoginDataStruct _loginData = LoginDataStruct();
  LoginDataStruct get loginData => _loginData;
  set loginData(LoginDataStruct value) {
    _loginData = value;
    prefs.setString('ff_loginData', value.serialize());
  }

  void updateLoginDataStruct(Function(LoginDataStruct) updateFn) {
    updateFn(_loginData);
    prefs.setString('ff_loginData', _loginData.serialize());
  }

  WatchListingFilterStruct _watchListingFilter = WatchListingFilterStruct();
  WatchListingFilterStruct get watchListingFilter => _watchListingFilter;
  set watchListingFilter(WatchListingFilterStruct value) {
    _watchListingFilter = value;
    prefs.setString('ff_watchListingFilter', value.serialize());
  }

  void updateWatchListingFilter(Function(WatchListingFilterStruct) updateFn) {
    updateFn(_watchListingFilter);
    prefs.setString('ff_watchListingFilter', _watchListingFilter.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
