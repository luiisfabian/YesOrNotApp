// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yes_or_not_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
