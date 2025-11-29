// lib/services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User> signInAnonymously() async {
    final UserCredential cred = await _auth.signInAnonymously();
    final user = cred.user!;
    await _createUserIfNotExists(user.uid);
    return user;
  }

  Future<void> _createUserIfNotExists(String uid) async {
    final doc = _db.collection('users').doc(uid);
    final snapshot = await doc.get();

    if (!snapshot.exists) {
      await doc.set({
        'name': 'User_${uid.substring(0,5)}',
        'avatar': '',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}
