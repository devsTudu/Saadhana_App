import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// FAQs in the App
class FAQsRecord extends FirestoreRecord {
  FAQsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title_question" field.
  String? _titleQuestion;
  String get titleQuestion => _titleQuestion ?? '';
  bool hasTitleQuestion() => _titleQuestion != null;

  // "response_answer" field.
  String? _responseAnswer;
  String get responseAnswer => _responseAnswer ?? '';
  bool hasResponseAnswer() => _responseAnswer != null;

  void _initializeFields() {
    _titleQuestion = snapshotData['title_question'] as String?;
    _responseAnswer = snapshotData['response_answer'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FAQs');

  static Stream<FAQsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FAQsRecord.fromSnapshot(s));

  static Future<FAQsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FAQsRecord.fromSnapshot(s));

  static FAQsRecord fromSnapshot(DocumentSnapshot snapshot) => FAQsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FAQsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FAQsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FAQsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FAQsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFAQsRecordData({
  String? titleQuestion,
  String? responseAnswer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title_question': titleQuestion,
      'response_answer': responseAnswer,
    }.withoutNulls,
  );

  return firestoreData;
}

class FAQsRecordDocumentEquality implements Equality<FAQsRecord> {
  const FAQsRecordDocumentEquality();

  @override
  bool equals(FAQsRecord? e1, FAQsRecord? e2) {
    return e1?.titleQuestion == e2?.titleQuestion &&
        e1?.responseAnswer == e2?.responseAnswer;
  }

  @override
  int hash(FAQsRecord? e) =>
      const ListEquality().hash([e?.titleQuestion, e?.responseAnswer]);

  @override
  bool isValidKey(Object? o) => o is FAQsRecord;
}
