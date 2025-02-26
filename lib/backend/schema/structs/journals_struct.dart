// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class JournalsStruct extends FFFirebaseStruct {
  JournalsStruct({
    DateTime? date,
    String? contentJournal,
    String? writer,
    bool? secret,
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _contentJournal = contentJournal,
        _writer = writer,
        _secret = secret,
        _title = title,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "content_journal" field.
  String? _contentJournal;
  String get contentJournal => _contentJournal ?? '';
  set contentJournal(String? val) => _contentJournal = val;

  bool hasContentJournal() => _contentJournal != null;

  // "writer" field.
  String? _writer;
  String get writer => _writer ?? 'user';
  set writer(String? val) => _writer = val;

  bool hasWriter() => _writer != null;

  // "secret" field.
  bool? _secret;
  bool get secret => _secret ?? false;
  set secret(bool? val) => _secret = val;

  bool hasSecret() => _secret != null;

  // "title" field.
  String? _title;
  String get title => _title ?? 'Journal';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static JournalsStruct fromMap(Map<String, dynamic> data) => JournalsStruct(
        date: data['date'] as DateTime?,
        contentJournal: data['content_journal'] as String?,
        writer: data['writer'] as String?,
        secret: data['secret'] as bool?,
        title: data['title'] as String?,
      );

  static JournalsStruct? maybeFromMap(dynamic data) =>
      data is Map ? JournalsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'content_journal': _contentJournal,
        'writer': _writer,
        'secret': _secret,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'content_journal': serializeParam(
          _contentJournal,
          ParamType.String,
        ),
        'writer': serializeParam(
          _writer,
          ParamType.String,
        ),
        'secret': serializeParam(
          _secret,
          ParamType.bool,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static JournalsStruct fromSerializableMap(Map<String, dynamic> data) =>
      JournalsStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        contentJournal: deserializeParam(
          data['content_journal'],
          ParamType.String,
          false,
        ),
        writer: deserializeParam(
          data['writer'],
          ParamType.String,
          false,
        ),
        secret: deserializeParam(
          data['secret'],
          ParamType.bool,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'JournalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JournalsStruct &&
        date == other.date &&
        contentJournal == other.contentJournal &&
        writer == other.writer &&
        secret == other.secret &&
        title == other.title;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, contentJournal, writer, secret, title]);
}

JournalsStruct createJournalsStruct({
  DateTime? date,
  String? contentJournal,
  String? writer,
  bool? secret,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JournalsStruct(
      date: date,
      contentJournal: contentJournal,
      writer: writer,
      secret: secret,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JournalsStruct? updateJournalsStruct(
  JournalsStruct? journals, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    journals
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJournalsStructData(
  Map<String, dynamic> firestoreData,
  JournalsStruct? journals,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (journals == null) {
    return;
  }
  if (journals.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && journals.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final journalsData = getJournalsFirestoreData(journals, forFieldValue);
  final nestedData = journalsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = journals.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJournalsFirestoreData(
  JournalsStruct? journals, [
  bool forFieldValue = false,
]) {
  if (journals == null) {
    return {};
  }
  final firestoreData = mapToFirestore(journals.toMap());

  // Add any Firestore field values
  journals.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJournalsListFirestoreData(
  List<JournalsStruct>? journalss,
) =>
    journalss?.map((e) => getJournalsFirestoreData(e, true)).toList() ?? [];
