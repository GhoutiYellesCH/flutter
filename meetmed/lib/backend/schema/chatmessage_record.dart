import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatmessageRecord extends FirestoreRecord {
  ChatmessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "timestemp" field.
  DateTime? _timestemp;
  DateTime? get timestemp => _timestemp;
  bool hasTimestemp() => _timestemp != null;

  // "ui_send" field.
  DocumentReference? _uiSend;
  DocumentReference? get uiSend => _uiSend;
  bool hasUiSend() => _uiSend != null;

  // "nameofsender" field.
  String? _nameofsender;
  String get nameofsender => _nameofsender ?? '';
  bool hasNameofsender() => _nameofsender != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _timestemp = snapshotData['timestemp'] as DateTime?;
    _uiSend = snapshotData['ui_send'] as DocumentReference?;
    _nameofsender = snapshotData['nameofsender'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatmessage')
          : FirebaseFirestore.instance.collectionGroup('chatmessage');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chatmessage').doc(id);

  static Stream<ChatmessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatmessageRecord.fromSnapshot(s));

  static Future<ChatmessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatmessageRecord.fromSnapshot(s));

  static ChatmessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatmessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatmessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatmessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatmessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatmessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatmessageRecordData({
  String? message,
  DateTime? timestemp,
  DocumentReference? uiSend,
  String? nameofsender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'timestemp': timestemp,
      'ui_send': uiSend,
      'nameofsender': nameofsender,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatmessageRecordDocumentEquality implements Equality<ChatmessageRecord> {
  const ChatmessageRecordDocumentEquality();

  @override
  bool equals(ChatmessageRecord? e1, ChatmessageRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.timestemp == e2?.timestemp &&
        e1?.uiSend == e2?.uiSend &&
        e1?.nameofsender == e2?.nameofsender;
  }

  @override
  int hash(ChatmessageRecord? e) => const ListEquality()
      .hash([e?.message, e?.timestemp, e?.uiSend, e?.nameofsender]);

  @override
  bool isValidKey(Object? o) => o is ChatmessageRecord;
}
