import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BloodgroupRecord extends FirestoreRecord {
  BloodgroupRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "output" field.
  String? _output;
  String get output => _output ?? '';
  bool hasOutput() => _output != null;

  void _initializeFields() {
    _output = snapshotData['output'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bloodgroup');

  static Stream<BloodgroupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BloodgroupRecord.fromSnapshot(s));

  static Future<BloodgroupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BloodgroupRecord.fromSnapshot(s));

  static BloodgroupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BloodgroupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BloodgroupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BloodgroupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BloodgroupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BloodgroupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBloodgroupRecordData({
  String? output,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'output': output,
    }.withoutNulls,
  );

  return firestoreData;
}

class BloodgroupRecordDocumentEquality implements Equality<BloodgroupRecord> {
  const BloodgroupRecordDocumentEquality();

  @override
  bool equals(BloodgroupRecord? e1, BloodgroupRecord? e2) {
    return e1?.output == e2?.output;
  }

  @override
  int hash(BloodgroupRecord? e) => const ListEquality().hash([e?.output]);

  @override
  bool isValidKey(Object? o) => o is BloodgroupRecord;
}
