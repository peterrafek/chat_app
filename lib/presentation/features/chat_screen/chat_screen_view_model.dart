
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;


  TextEditingController msgController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    listenToMessages();
  }

  void listenToMessages() {
    _firestore
        .collection('chats')
        .orderBy('timestamp')
        .snapshots()
        .listen((snapshot) {
      messages.value = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> sendMessage() async {
    final text = msgController.text.trim();
    if (text.isEmpty) return;

    try {
      await FirebaseFirestore.instance.collection('chats').add({
        'content': text,
        'senderId': 'user1',
        'timestamp': Timestamp.now(),
      });
      msgController.clear();
      print("Message sent!");
      Future.delayed(Duration(seconds: 2), () async {
        await _firestore.collection('chats').add({
          'content': getAutoReply(text),
          'senderId': 'assistant',
          'timestamp': Timestamp.now(),
        });
      });
    } catch (e) {
      print("Firebase Error: $e");
    }
  }
}
String getAutoReply(String userMessage) {
  if (userMessage.toLowerCase().contains("hello")) {
    return "Hi there! How can I assist you today?";
  } else if (userMessage.toLowerCase().contains("problem")) {
    return "Sorry to hear that. Can you describe your problem?";
  } else {
    return "Thank you for your message! We'll get back to you shortly.";
  }
}
