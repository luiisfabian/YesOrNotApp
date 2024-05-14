import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));

    final inputDecoration = InputDecoration(
      hintText: "Finaliza tu mensaje con ??",
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          print("Boton ${textValue}");
          textController.clear();
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.requestFocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        print("sbmit value");
        focusNode.requestFocus();
      },
    );
  }
}
