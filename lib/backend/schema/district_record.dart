import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DistrictRecord extends FirestoreRecord {
  DistrictRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "output" field.
  String? _output;
  String get output => _output ?? '';
  bool hasOutput() => _output != null;

  // "stateref" field.
  String? _stateref;
  String get stateref => _stateref ?? '';
  bool hasStateref() => _stateref != null;

  void _initializeFields() {
    _output = snapshotData['output'] as String?;
    _stateref = snapshotData['stateref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('district');

  static Stream<DistrictRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DistrictRecord.fromSnapshot(s));

  static Future<DistrictRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DistrictRecord.fromSnapshot(s));

  static DistrictRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DistrictRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DistrictRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DistrictRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DistrictRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DistrictRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDistrictRecordData({
  String? output,
  String? stateref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'output': output,
      'stateref': stateref,
    }.withoutNulls,
  );

  return firestoreData;
}

class DistrictRecordDocumentEquality implements Equality<DistrictRecord> {
  const DistrictRecordDocumentEquality();

  @override
  bool equals(DistrictRecord? e1, DistrictRecord? e2) {
    return e1?.output == e2?.output && e1?.stateref == e2?.stateref;
  }

  @override
  int hash(DistrictRecord? e) =>
      const ListEquality().hash([e?.output, e?.stateref]);

  @override
  bool isValidKey(Object? o) => o is DistrictRecord;
}
