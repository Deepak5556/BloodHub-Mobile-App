import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DonationformRecord extends FirestoreRecord {
  DonationformRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "boloodgroup" field.
  String? _boloodgroup;
  String get boloodgroup => _boloodgroup ?? '';
  bool hasBoloodgroup() => _boloodgroup != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  bool hasDob() => _dob != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "phonr_number" field.
  String? _phonrNumber;
  String get phonrNumber => _phonrNumber ?? '';
  bool hasPhonrNumber() => _phonrNumber != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _boloodgroup = snapshotData['boloodgroup'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _dob = snapshotData['dob'] as String?;
    _gender = snapshotData['gender'] as String?;
    _state = snapshotData['state'] as String?;
    _district = snapshotData['district'] as String?;
    _city = snapshotData['city'] as String?;
    _weight = castToType<int>(snapshotData['weight']);
    _phonrNumber = snapshotData['phonr_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('donationform');

  static Stream<DonationformRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DonationformRecord.fromSnapshot(s));

  static Future<DonationformRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DonationformRecord.fromSnapshot(s));

  static DonationformRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DonationformRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DonationformRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DonationformRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DonationformRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DonationformRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDonationformRecordData({
  String? name,
  String? boloodgroup,
  int? age,
  String? dob,
  String? gender,
  String? state,
  String? district,
  String? city,
  int? weight,
  String? phonrNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'boloodgroup': boloodgroup,
      'age': age,
      'dob': dob,
      'gender': gender,
      'state': state,
      'district': district,
      'city': city,
      'weight': weight,
      'phonr_number': phonrNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class DonationformRecordDocumentEquality
    implements Equality<DonationformRecord> {
  const DonationformRecordDocumentEquality();

  @override
  bool equals(DonationformRecord? e1, DonationformRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.boloodgroup == e2?.boloodgroup &&
        e1?.age == e2?.age &&
        e1?.dob == e2?.dob &&
        e1?.gender == e2?.gender &&
        e1?.state == e2?.state &&
        e1?.district == e2?.district &&
        e1?.city == e2?.city &&
        e1?.weight == e2?.weight &&
        e1?.phonrNumber == e2?.phonrNumber;
  }

  @override
  int hash(DonationformRecord? e) => const ListEquality().hash([
        e?.name,
        e?.boloodgroup,
        e?.age,
        e?.dob,
        e?.gender,
        e?.state,
        e?.district,
        e?.city,
        e?.weight,
        e?.phonrNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is DonationformRecord;
}
