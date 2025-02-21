import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'records',
      'saadhana.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<TotaldaysRow>> totaldays() => performTotaldays(
        _database,
      );

  Future<List<SeeAllRow>> seeAll() => performSeeAll(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future insertrecords({
    String? datefilled,
    String? wakeuptime,
    String? sleeptime,
    int? restduration,
    String? japacompleted,
    int? morningprogmangalartiontime,
    int? morningprogmangalartidhoti,
    int? morningproghairstrimmed,
    int? morningprogbeardtrimmed,
    int? morningprognailstrimmed,
    int? musicalinstrumentpractice,
    int? musicalbhajanpractice,
    int? acadslecturesjob,
    int? acadsprojectsassignment,
    int? acadsexamprep,
    int? pathanprabhupadbooks,
    int? shravanprabhupadlectures,
    int? shravanofflinelectures,
    int? shravanmaharajlectures,
    int? sewapreaching,
    int? sewacooking,
    int? sewacleaning,
  }) =>
      performInsertrecords(
        _database,
        datefilled: datefilled,
        wakeuptime: wakeuptime,
        sleeptime: sleeptime,
        restduration: restduration,
        japacompleted: japacompleted,
        morningprogmangalartiontime: morningprogmangalartiontime,
        morningprogmangalartidhoti: morningprogmangalartidhoti,
        morningproghairstrimmed: morningproghairstrimmed,
        morningprogbeardtrimmed: morningprogbeardtrimmed,
        morningprognailstrimmed: morningprognailstrimmed,
        musicalinstrumentpractice: musicalinstrumentpractice,
        musicalbhajanpractice: musicalbhajanpractice,
        acadslecturesjob: acadslecturesjob,
        acadsprojectsassignment: acadsprojectsassignment,
        acadsexamprep: acadsexamprep,
        pathanprabhupadbooks: pathanprabhupadbooks,
        shravanprabhupadlectures: shravanprabhupadlectures,
        shravanofflinelectures: shravanofflinelectures,
        shravanmaharajlectures: shravanmaharajlectures,
        sewapreaching: sewapreaching,
        sewacooking: sewacooking,
        sewacleaning: sewacleaning,
      );

  /// END UPDATE QUERY CALLS
}
