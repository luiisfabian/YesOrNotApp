import 'package:flutter/material.dart';
import 'package:yes_or_not_app/config/helpers/get_yes_or_not_answer.dart';
import 'package:yes_or_not_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola mor", fromWho: FromWho.me),
  Message(text: 'Vamos?', fromWho: FromWho.her, image: 'https://yesno.wtf/assets/no/22-8806dbccb1edf544723b7f095ff722e8.gif'),
    // Message(text: "si o no?", fromWho: FromWho.me),
    // Message(text: "coma mierda gonorrea", fromWho: FromWho.her, image: 'https://yesno.wtf/assets/yes/6-304e564038051dab8a5aa43156cdc20d.gif'),
    // Message(text: "yo soy mero programador?", fromWho: FromWho.me),
    // Message(text: "si", fromWho: FromWho.her, image: 'https://yesno.wtf/assets/yes/6-304e564038051dab8a5aa43156cdc20d.gif'),
  ];

  ScrollController scrollController = new ScrollController();

  final GetYesOrNotAnswer getYesOrNotAnswer = new GetYesOrNotAnswer();

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      await herReply();
    }
    notifyListeners();
    moveScrollToMove();
  }

  Future<void> moveScrollToMove() async {
    await Future.delayed(const Duration(milliseconds: 200));

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final herMessage = await GetYesOrNotAnswer().getAnswer();

    messageList.add(herMessage);
    notifyListeners();
    moveScrollToMove();
  }
}
