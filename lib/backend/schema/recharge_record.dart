import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RechargeRecord extends FirestoreRecord {
  RechargeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "Value" field.
  int? _value;
  int get value => _value ?? 0;
  bool hasValue() => _value != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _price = castToType<int>(snapshotData['Price']);
    _value = castToType<int>(snapshotData['Value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recharge');

  static Stream<RechargeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RechargeRecord.fromSnapshot(s));

  static Future<RechargeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RechargeRecord.fromSnapshot(s));

  static RechargeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RechargeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RechargeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RechargeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RechargeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RechargeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRechargeRecordData({
  String? name,
  int? price,
  int? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Price': price,
      'Value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class RechargeRecordDocumentEquality implements Equality<RechargeRecord> {
  const RechargeRecordDocumentEquality();

  @override
  bool equals(RechargeRecord? e1, RechargeRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.value == e2?.value;
  }

  @override
  int hash(RechargeRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.value]);

  @override
  bool isValidKey(Object? o) => o is RechargeRecord;
}
