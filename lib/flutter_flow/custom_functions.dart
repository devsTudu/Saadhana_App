import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

int? checkSelected(
  String target,
  List<String> selectList,
) {
  if (selectList.contains(target)) {
    return 1;
  } else {
    return 0;
  }
}

int? numberOfDaysFromStart(List<DateTime> dateArray) {
  // Given a list of DateTime, return the number of days between today and the minimum date from the list
  DateTime today = DateTime.now();
  DateTime? minDate = dateArray.isNotEmpty
      ? dateArray
          .reduce((value, element) => value.isBefore(element) ? value : element)
      : null;
  if (minDate != null) {
    Duration difference = minDate.difference(today);
    return (difference.inDays).abs();
  }
  return 0;
}

int numberOfDays(List<DateTime> listDates) {
// return the length of the list
  return listDates.length;
}

int numberOfTimesToday(List<DateTime> date) {
  // the number of values that are equal to todays date
  DateTime today = DateTime.now();
  int count = date
      .where((d) =>
          d.year == today.year && d.month == today.month && d.day == today.day)
      .length;
  return count;
}

List<DateTime> removeTodays(List<DateTime> dateList) {
  // remove only one occurence from the date list that is equal to today, and return the modified list
  DateTime today = DateTime.now();
  bool removed = false;

  List<DateTime> modifiedList = List<DateTime>.from(dateList);

  for (int i = 0; i < modifiedList.length; i++) {
    if (modifiedList[i].year == today.year &&
        modifiedList[i].month == today.month &&
        modifiedList[i].day == today.day &&
        !removed) {
      modifiedList.removeAt(i);
      removed = true;
    }
  }

  return modifiedList;
}

String combineAllComments(List<JournalsStruct>? journals) {
  // return a string that joins all the values for content in the list of journals, and separates them with ','
  return journals?.map((journal) => journal.contentJournal).join(', ') ?? '';
}

int valueCalculate(
  int balance,
  int price,
) {
  return balance ~/ price;
}

List<JournalAddressStruct> arrayOfJournalIndexes(List<HabitStruct> habitList) {
// for each and every habit in the list, take the indexes of the habits and there individual journals
  List<JournalAddressStruct> journalIndexes = [];

  for (int i = 0; i < habitList.length; i++) {
    HabitStruct habit = habitList[i];
    for (int j = 0; j < habit.journal.length; j++) {
      JournalAddressStruct journalIndex =
          JournalAddressStruct(habitidx: i, journalidx: j);
      journalIndexes.add(journalIndex);
    }
  }

  return journalIndexes;
}
