import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityRecord extends FirestoreRecord {
  CityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "output" field.
  String? _output;
  String get output => _output ?? '';
  bool hasOutput() => _output != null;

  // "districtref" field.
  String? _districtref;
  String get districtref => _districtref ?? '';
  bool hasDistrictref() => _districtref != null;

  // "stateref" field.
  String? _stateref;
  String get stateref => _stateref ?? '';
  bool hasStateref() => _stateref != null;

  void _initializeFields() {
    _output = snapshotData['output'] as String?;
    _districtref = snapshotData['districtref'] as String?;
    _stateref = snapshotData['stateref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('city');

  static Stream<CityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CityRecord.fromSnapshot(s));

  static Future<CityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CityRecord.fromSnapshot(s));

  static CityRecord fromSnapshot(DocumentSnapshot snapshot) => CityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCityRecordData({
  String? output,
  String? districtref,
  String? stateref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'output': output,
      'districtref': districtref,
      'stateref': stateref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CityRecordDocumentEquality implements Equality<CityRecord> {
  const CityRecordDocumentEquality();

  @override
  bool equals(CityRecord? e1, CityRecord? e2) {
    return e1?.output == e2?.output &&
        e1?.districtref == e2?.districtref &&
        e1?.stateref == e2?.stateref;
  }

  @override
  int hash(CityRecord? e) =>
      const ListEquality().hash([e?.output, e?.districtref, e?.stateref]);

  @override
  bool isValidKey(Object? o) => o is CityRecord;
}
