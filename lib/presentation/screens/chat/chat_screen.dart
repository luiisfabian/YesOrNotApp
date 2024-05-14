// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yes_or_not_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_or_not_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_or_not_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8UVJqfVZhGA7aE3uZmQj5Af1HIxUGANBt_gHe53_QDw&s"),
          ),
        ),
        title: Text("Chat"),
        centerTitle: true,
      ),
      body: _chatView(),
    );
  }
}

class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? HerMessageBubble()
                      : MyMessageBubble();
                },
              ),
            ),
            // todo caja de texto
            MessageFieldBox()
          ],
        ),
      ),
    );
  }
}

