
import 'package:yes_or_not_app/domain/entities/message.dart';

class ChatProvider {
  List<Message> messageList = [
    Message(text: "Hola mor", fromWho: FromWho.me),
    Message(text: "ya estas en casa?", fromWho: FromWho.her)
  ];

  Future<void> sendMessage(String text) async{

  }
}
