import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReporteddonarRecord extends FirestoreRecord {
  ReporteddonarRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "rep_name" field.
  String? _repName;
  String get repName => _repName ?? '';
  bool hasRepName() => _repName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  void _initializeFields() {
    _repName = snapshotData['rep_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _feedback = snapshotData['feedback'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reporteddonar');

  static Stream<ReporteddonarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReporteddonarRecord.fromSnapshot(s));

  static Future<ReporteddonarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReporteddonarRecord.fromSnapshot(s));

  static ReporteddonarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReporteddonarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReporteddonarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReporteddonarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReporteddonarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReporteddonarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReporteddonarRecordData({
  String? repName,
  String? phoneNumber,
  String? feedback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rep_name': repName,
      'phone_number': phoneNumber,
      'feedback': feedback,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReporteddonarRecordDocumentEquality
    implements Equality<ReporteddonarRecord> {
  const ReporteddonarRecordDocumentEquality();

  @override
  bool equals(ReporteddonarRecord? e1, ReporteddonarRecord? e2) {
    return e1?.repName == e2?.repName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.feedback == e2?.feedback;
  }

  @override
  int hash(ReporteddonarRecord? e) =>
      const ListEquality().hash([e?.repName, e?.phoneNumber, e?.feedback]);

  @override
  bool isValidKey(Object? o) => o is ReporteddonarRecord;
}
