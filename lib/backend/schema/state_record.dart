import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StateRecord extends FirestoreRecord {
  StateRecord._(
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
      FirebaseFirestore.instance.collection('state');

  static Stream<StateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StateRecord.fromSnapshot(s));

  static Future<StateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StateRecord.fromSnapshot(s));

  static StateRecord fromSnapshot(DocumentSnapshot snapshot) => StateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStateRecordData({
  String? output,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'output': output,
    }.withoutNulls,
  );

  return firestoreData;
}

class StateRecordDocumentEquality implements Equality<StateRecord> {
  const StateRecordDocumentEquality();

  @override
  bool equals(StateRecord? e1, StateRecord? e2) {
    return e1?.output == e2?.output;
  }

  @override
  int hash(StateRecord? e) => const ListEquality().hash([e?.output]);

  @override
  bool isValidKey(Object? o) => o is StateRecord;
}
