import 'package:flutter/material.dart';
import 'package:yes_or_not_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  const HerMessageBubble({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary,
          ),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _imageBubble(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _imageBubble extends StatelessWidget {
  const _imageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Container(
              width: _size.width * 0.7,
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        "https://yesno.wtf/assets/no/3-80a6f5b5d6684674bcfeda34accca4e1.gif",
        width: _size.width * 0.7,
        height: 150,
      ),
    );
  }
}
