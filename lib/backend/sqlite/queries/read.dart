import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN TOTALDAYS
Future<List<TotaldaysRow>> performTotaldays(
  Database database,
) {
  final query = '''
SELECT count(DISTINCT date_filled) as days FROM "Records"
''';
  return _readQuery(database, query, (d) => TotaldaysRow(d));
}

class TotaldaysRow extends SqliteRow {
  TotaldaysRow(Map<String, dynamic> data) : super(data);

  int? get days => data['days'] as int?;
}

/// END TOTALDAYS

/// BEGIN SEEALL
Future<List<SeeAllRow>> performSeeAll(
  Database database,
) {
  final query = '''
SELECT * FROM Records;
''';
  return _readQuery(database, query, (d) => SeeAllRow(d));
}

class SeeAllRow extends SqliteRow {
  SeeAllRow(Map<String, dynamic> data) : super(data);

  DateTime? get dateFilled => data['date_filled'] as DateTime?;
  DateTime? get wakeupTime => data['wakeup_time'] as DateTime?;
  int? get morningProgMangalArtiOntime =>
      data['morning_prog_mangal_arti_ontime'] as int?;
  int? get musicalInstrumentPractice =>
      data['musical_instrument_practice'] as int?;
}

/// END SEEALL
