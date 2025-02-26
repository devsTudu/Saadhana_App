import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userhabit = (await secureStorage.getStringList('ff_userhabit'))
              ?.map((x) {
                try {
                  return HabitStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _userhabit;
    });
    await _safeInitAsync(() async {
      _isDarkMode = await secureStorage.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    await _safeInitAsync(() async {
      _username = await secureStorage.getString('ff_username') ?? _username;
    });
    await _safeInitAsync(() async {
      _journalswritten =
          (await secureStorage.getStringList('ff_journalswritten'))
                  ?.map((x) {
                    try {
                      return JournalsStruct.fromSerializableMap(jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _journalswritten;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  /// List of habits
  List<HabitStruct> _userhabit = [];
  List<HabitStruct> get userhabit => _userhabit;
  set userhabit(List<HabitStruct> value) {
    _userhabit = value;
    secureStorage.setStringList(
        'ff_userhabit', value.map((x) => x.serialize()).toList());
  }

  void deleteUserhabit() {
    secureStorage.delete(key: 'ff_userhabit');
  }

  void addToUserhabit(HabitStruct value) {
    userhabit.add(value);
    secureStorage.setStringList(
        'ff_userhabit', _userhabit.map((x) => x.serialize()).toList());
  }

  void removeFromUserhabit(HabitStruct value) {
    userhabit.remove(value);
    secureStorage.setStringList(
        'ff_userhabit', _userhabit.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserhabit(int index) {
    userhabit.removeAt(index);
    secureStorage.setStringList(
        'ff_userhabit', _userhabit.map((x) => x.serialize()).toList());
  }

  void updateUserhabitAtIndex(
    int index,
    HabitStruct Function(HabitStruct) updateFn,
  ) {
    userhabit[index] = updateFn(_userhabit[index]);
    secureStorage.setStringList(
        'ff_userhabit', _userhabit.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserhabit(int index, HabitStruct value) {
    userhabit.insert(index, value);
    secureStorage.setStringList(
        'ff_userhabit', _userhabit.map((x) => x.serialize()).toList());
  }

  /// See if Dark Mode is on or not
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    secureStorage.setBool('ff_isDarkMode', value);
  }

  void deleteIsDarkMode() {
    secureStorage.delete(key: 'ff_isDarkMode');
  }

  /// Name of the user when starting the app
  String _username = 'Saadhaka';
  String get username => _username;
  set username(String value) {
    _username = value;
    secureStorage.setString('ff_username', value);
  }

  void deleteUsername() {
    secureStorage.delete(key: 'ff_username');
  }

  /// Journals Written
  List<JournalsStruct> _journalswritten = [
    JournalsStruct.fromSerializableMap(jsonDecode(
        '{\"date\":\"1740569425097\",\"content_journal\":\"Hello World\",\"writer\":\"Hello World\",\"secret\":\"false\"}'))
  ];
  List<JournalsStruct> get journalswritten => _journalswritten;
  set journalswritten(List<JournalsStruct> value) {
    _journalswritten = value;
    secureStorage.setStringList(
        'ff_journalswritten', value.map((x) => x.serialize()).toList());
  }

  void deleteJournalswritten() {
    secureStorage.delete(key: 'ff_journalswritten');
  }

  void addToJournalswritten(JournalsStruct value) {
    journalswritten.add(value);
    secureStorage.setStringList('ff_journalswritten',
        _journalswritten.map((x) => x.serialize()).toList());
  }

  void removeFromJournalswritten(JournalsStruct value) {
    journalswritten.remove(value);
    secureStorage.setStringList('ff_journalswritten',
        _journalswritten.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromJournalswritten(int index) {
    journalswritten.removeAt(index);
    secureStorage.setStringList('ff_journalswritten',
        _journalswritten.map((x) => x.serialize()).toList());
  }

  void updateJournalswrittenAtIndex(
    int index,
    JournalsStruct Function(JournalsStruct) updateFn,
  ) {
    journalswritten[index] = updateFn(_journalswritten[index]);
    secureStorage.setStringList('ff_journalswritten',
        _journalswritten.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInJournalswritten(int index, JournalsStruct value) {
    journalswritten.insert(index, value);
    secureStorage.setStringList('ff_journalswritten',
        _journalswritten.map((x) => x.serialize()).toList());
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
