import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';

class ChatService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Message>> getMessages(String chatId) {
    return _db
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("timestamp")
        .snapshots()
        .map((snap) =>
            snap.docs.map((e) => Message.fromJson(e.data())).toList());
  }

  Future<void> sendMessage(
      String chatId, Message message) async {
    await _db
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .doc(message.id)
        .set(message.toJson());
  }
}
