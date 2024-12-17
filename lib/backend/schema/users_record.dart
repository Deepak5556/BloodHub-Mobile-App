import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  bool hasLastname() => _lastname != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "emailverfication" field.
  bool? _emailverfication;
  bool get emailverfication => _emailverfication ?? false;
  bool hasEmailverfication() => _emailverfication != null;

  // "dateofbirth" field.
  DateTime? _dateofbirth;
  DateTime? get dateofbirth => _dateofbirth;
  bool hasDateofbirth() => _dateofbirth != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _lastname = snapshotData['lastname'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _password = snapshotData['password'] as String?;
    _emailverfication = snapshotData['emailverfication'] as bool?;
    _dateofbirth = snapshotData['dateofbirth'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? photoUrl,
  String? email,
  String? displayName,
  String? lastname,
  String? phoneNumber,
  String? uid,
  DateTime? createdTime,
  String? password,
  bool? emailverfication,
  DateTime? dateofbirth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'email': email,
      'display_name': displayName,
      'lastname': lastname,
      'phone_number': phoneNumber,
      'uid': uid,
      'created_time': createdTime,
      'password': password,
      'emailverfication': emailverfication,
      'dateofbirth': dateofbirth,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.photoUrl == e2?.photoUrl &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.lastname == e2?.lastname &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.password == e2?.password &&
        e1?.emailverfication == e2?.emailverfication &&
        e1?.dateofbirth == e2?.dateofbirth;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.photoUrl,
        e?.email,
        e?.displayName,
        e?.lastname,
        e?.phoneNumber,
        e?.uid,
        e?.createdTime,
        e?.password,
        e?.emailverfication,
        e?.dateofbirth
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
