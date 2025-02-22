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
      if (await secureStorage.read(key: 'ff_AIData') != null) {
        try {
          _AIData =
              jsonDecode(await secureStorage.getString('ff_AIData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _isDarkMode = await secureStorage.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  /// List of habits
  List<HabitStruct> _userhabit = [
    HabitStruct.fromSerializableMap(jsonDecode(
        '{\"Title\":\"Wake Up early\",\"description\":\"Waking up early by 5 am\",\"dates\":\"[\\\"1739519160000\\\",\\\"1739432820000\\\",\\\"1739173620000\\\"]\",\"journal\":\"[\\\"{\\\\\\\"date\\\\\\\":\\\\\\\"1739605868392\\\\\\\",\\\\\\\"content_journal\\\\\\\":\\\\\\\"Today I created an app\\\\\\\"}\\\",\\\"{\\\\\\\"date\\\\\\\":\\\\\\\"1739260260000\\\\\\\",\\\\\\\"content_journal\\\\\\\":\\\\\\\"I planned for the app\\\\\\\"}\\\"]\",\"category\":\"[]\",\"score\":\"7.8\"}'))
  ];
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

  /// The Data for the AI, to be used through out the app
  dynamic _AIData = jsonDecode(
      '{\"description_prompt\":\"In users perspective, write a description for habit telling the benifits, process and challenges, in a summary of 50 words, without title, name of habit is \",\"type_comments\":[\"Feedback\",\"Tips\",\"Motivate\",\"Criticise\",\"Solve\"]}');
  dynamic get AIData => _AIData;
  set AIData(dynamic value) {
    _AIData = value;
    secureStorage.setString('ff_AIData', jsonEncode(value));
  }

  void deleteAIData() {
    secureStorage.delete(key: 'ff_AIData');
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
