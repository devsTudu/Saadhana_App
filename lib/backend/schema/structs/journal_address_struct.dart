// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class JournalAddressStruct extends FFFirebaseStruct {
  JournalAddressStruct({
    int? habitidx,
    int? journalidx,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _habitidx = habitidx,
        _journalidx = journalidx,
        super(firestoreUtilData);

  // "habitidx" field.
  int? _habitidx;
  int get habitidx => _habitidx ?? 0;
  set habitidx(int? val) => _habitidx = val;

  void incrementHabitidx(int amount) => habitidx = habitidx + amount;

  bool hasHabitidx() => _habitidx != null;

  // "journalidx" field.
  int? _journalidx;
  int get journalidx => _journalidx ?? 0;
  set journalidx(int? val) => _journalidx = val;

  void incrementJournalidx(int amount) => journalidx = journalidx + amount;

  bool hasJournalidx() => _journalidx != null;

  static JournalAddressStruct fromMap(Map<String, dynamic> data) =>
      JournalAddressStruct(
        habitidx: castToType<int>(data['habitidx']),
        journalidx: castToType<int>(data['journalidx']),
      );

  static JournalAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? JournalAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'habitidx': _habitidx,
        'journalidx': _journalidx,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'habitidx': serializeParam(
          _habitidx,
          ParamType.int,
        ),
        'journalidx': serializeParam(
          _journalidx,
          ParamType.int,
        ),
      }.withoutNulls;

  static JournalAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      JournalAddressStruct(
        habitidx: deserializeParam(
          data['habitidx'],
          ParamType.int,
          false,
        ),
        journalidx: deserializeParam(
          data['journalidx'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'JournalAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JournalAddressStruct &&
        habitidx == other.habitidx &&
        journalidx == other.journalidx;
  }

  @override
  int get hashCode => const ListEquality().hash([habitidx, journalidx]);
}

JournalAddressStruct createJournalAddressStruct({
  int? habitidx,
  int? journalidx,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JournalAddressStruct(
      habitidx: habitidx,
      journalidx: journalidx,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JournalAddressStruct? updateJournalAddressStruct(
  JournalAddressStruct? journalAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    journalAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJournalAddressStructData(
  Map<String, dynamic> firestoreData,
  JournalAddressStruct? journalAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (journalAddress == null) {
    return;
  }
  if (journalAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && journalAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final journalAddressData =
      getJournalAddressFirestoreData(journalAddress, forFieldValue);
  final nestedData =
      journalAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = journalAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJournalAddressFirestoreData(
  JournalAddressStruct? journalAddress, [
  bool forFieldValue = false,
]) {
  if (journalAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(journalAddress.toMap());

  // Add any Firestore field values
  journalAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJournalAddressListFirestoreData(
  List<JournalAddressStruct>? journalAddresss,
) =>
    journalAddresss
        ?.map((e) => getJournalAddressFirestoreData(e, true))
        .toList() ??
    [];
