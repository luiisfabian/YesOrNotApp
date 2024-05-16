import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
   MessageFieldBox({super.key, required this.onValue});
  final ValueChanged<String> onValue;
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
          textController.clear();
          onValue(textValue);
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
        onValue(value);
      },
    );
  }
}
