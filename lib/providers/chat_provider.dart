import 'package:app_mensajes/entities/message.dart';
import 'package:app_mensajes/helpers/get_yes_answer.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollcontroller = ScrollController();
  final gteYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola mi amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await gteYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));
    chatScrollcontroller.animateTo(
        chatScrollcontroller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut);
  }
}
