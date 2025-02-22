// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitStruct extends FFFirebaseStruct {
  HabitStruct({
    String? title,
    String? description,
    List<DateTime>? dates,
    List<JournalsStruct>? journal,
    List<String>? category,
    DateTime? dueDate,
    double? score,
    bool? hasDue,
    DateTime? createDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _dates = dates,
        _journal = journal,
        _category = category,
        _dueDate = dueDate,
        _score = score,
        _hasDue = hasDue,
        _createDate = createDate,
        super(firestoreUtilData);

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "dates" field.
  List<DateTime>? _dates;
  List<DateTime> get dates => _dates ?? const [];
  set dates(List<DateTime>? val) => _dates = val;

  void updateDates(Function(List<DateTime>) updateFn) {
    updateFn(_dates ??= []);
  }

  bool hasDates() => _dates != null;

  // "journal" field.
  List<JournalsStruct>? _journal;
  List<JournalsStruct> get journal => _journal ?? const [];
  set journal(List<JournalsStruct>? val) => _journal = val;

  void updateJournal(Function(List<JournalsStruct>) updateFn) {
    updateFn(_journal ??= []);
  }

  bool hasJournal() => _journal != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  set category(List<String>? val) => _category = val;

  void updateCategory(Function(List<String>) updateFn) {
    updateFn(_category ??= []);
  }

  bool hasCategory() => _category != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  set dueDate(DateTime? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 30.0;
  set score(double? val) => _score = val;

  void incrementScore(double amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "hasDue" field.
  bool? _hasDue;
  bool get hasDue => _hasDue ?? false;
  set hasDue(bool? val) => _hasDue = val;

  bool hasHasDue() => _hasDue != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  set createDate(DateTime? val) => _createDate = val;

  bool hasCreateDate() => _createDate != null;

  static HabitStruct fromMap(Map<String, dynamic> data) => HabitStruct(
        title: data['Title'] as String?,
        description: data['description'] as String?,
        dates: getDataList(data['dates']),
        journal: getStructList(
          data['journal'],
          JournalsStruct.fromMap,
        ),
        category: getDataList(data['category']),
        dueDate: data['due_date'] as DateTime?,
        score: castToType<double>(data['score']),
        hasDue: data['hasDue'] as bool?,
        createDate: data['createDate'] as DateTime?,
      );

  static HabitStruct? maybeFromMap(dynamic data) =>
      data is Map ? HabitStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'description': _description,
        'dates': _dates,
        'journal': _journal?.map((e) => e.toMap()).toList(),
        'category': _category,
        'due_date': _dueDate,
        'score': _score,
        'hasDue': _hasDue,
        'createDate': _createDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'dates': serializeParam(
          _dates,
          ParamType.DateTime,
          isList: true,
        ),
        'journal': serializeParam(
          _journal,
          ParamType.DataStruct,
          isList: true,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
          isList: true,
        ),
        'due_date': serializeParam(
          _dueDate,
          ParamType.DateTime,
        ),
        'score': serializeParam(
          _score,
          ParamType.double,
        ),
        'hasDue': serializeParam(
          _hasDue,
          ParamType.bool,
        ),
        'createDate': serializeParam(
          _createDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static HabitStruct fromSerializableMap(Map<String, dynamic> data) =>
      HabitStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        dates: deserializeParam<DateTime>(
          data['dates'],
          ParamType.DateTime,
          true,
        ),
        journal: deserializeStructParam<JournalsStruct>(
          data['journal'],
          ParamType.DataStruct,
          true,
          structBuilder: JournalsStruct.fromSerializableMap,
        ),
        category: deserializeParam<String>(
          data['category'],
          ParamType.String,
          true,
        ),
        dueDate: deserializeParam(
          data['due_date'],
          ParamType.DateTime,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.double,
          false,
        ),
        hasDue: deserializeParam(
          data['hasDue'],
          ParamType.bool,
          false,
        ),
        createDate: deserializeParam(
          data['createDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'HabitStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HabitStruct &&
        title == other.title &&
        description == other.description &&
        listEquality.equals(dates, other.dates) &&
        listEquality.equals(journal, other.journal) &&
        listEquality.equals(category, other.category) &&
        dueDate == other.dueDate &&
        score == other.score &&
        hasDue == other.hasDue &&
        createDate == other.createDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        dates,
        journal,
        category,
        dueDate,
        score,
        hasDue,
        createDate
      ]);
}

HabitStruct createHabitStruct({
  String? title,
  String? description,
  DateTime? dueDate,
  double? score,
  bool? hasDue,
  DateTime? createDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HabitStruct(
      title: title,
      description: description,
      dueDate: dueDate,
      score: score,
      hasDue: hasDue,
      createDate: createDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HabitStruct? updateHabitStruct(
  HabitStruct? habit, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    habit
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHabitStructData(
  Map<String, dynamic> firestoreData,
  HabitStruct? habit,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (habit == null) {
    return;
  }
  if (habit.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && habit.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final habitData = getHabitFirestoreData(habit, forFieldValue);
  final nestedData = habitData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = habit.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHabitFirestoreData(
  HabitStruct? habit, [
  bool forFieldValue = false,
]) {
  if (habit == null) {
    return {};
  }
  final firestoreData = mapToFirestore(habit.toMap());

  // Add any Firestore field values
  habit.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHabitListFirestoreData(
  List<HabitStruct>? habits,
) =>
    habits?.map((e) => getHabitFirestoreData(e, true)).toList() ?? [];
