import 'package:sqflite/sqflite.dart';

/// BEGIN INSERTRECORDS
Future performInsertrecords(
  Database database, {
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
}) {
  final query = '''
INSERT INTO Records (
    date_filled,
    wakeup_time,
    sleep_time,
    rest_duration,
    japa_completed,
    morning_prog_mangal_arti_ontime,
    morning_prog_mangal_arti_dhoti,
    morning_prog_hairs_trimmed,
    morning_prog_beard_trimmed,
    morning_prog_nails_trimmed,
    musical_instrument_practice,
    musical_bhajan_practice,
    acads_lectures_job,
    acads_projects_assignment,
    acads_exam_prep,
    pathan_prabhupad_books,
    shravan_prabhupad_lectures,
    shravan_offline_lectures,
    shravan_maharaj_lectures,
    sewa_preaching,
    sewa_cooking,
    sewa_cleaning
) VALUES (
    "${datefilled}",  -- Date 
    "${wakeuptime}",  -- Wakeup time
    "${sleeptime}",   -- Sleep time
    ${restduration},-- Rest duration (in minutes)
    "${japacompleted}",-- Japa completed
    ${morningprogmangalartiontime},-- Arti on time
    ${morningprogmangalartidhoti},-- Wore dhoti
    ${morningproghairstrimmed},-- Hair trimmed
    ${morningprogbeardtrimmed},-- Beard trimmed
    ${morningprognailstrimmed},-- Nails trimmed
    ${musicalinstrumentpractice},-- Instrument practice
    ${musicalbhajanpractice},-- Bhajan practice
    ${acadslecturesjob},-- Academic/job work
    ${acadsprojectsassignment},-- Projects/assignments
    ${acadsexamprep},-- Exam prep
    ${pathanprabhupadbooks},-- Prabhupada books
    ${shravanprabhupadlectures},-- Prabhupada lectures
    ${shravanofflinelectures},-- Offline lectures
    ${shravanmaharajlectures},-- Maharaj lectures
    ${sewapreaching},-- Preaching seva
    ${sewacooking},-- Cooking seva
    ${sewacleaning}-- Cleaning seva
);
''';
  return database.rawQuery(query);
}

/// END INSERTRECORDS
