import 'package:chameleonapp/whatsapp/model/chat_model.dart';
import 'package:chameleonapp/whatsapp/model//message_model.dart';
import 'package:chameleonapp/whatsapp/model/app_data.dart';

class ChatService {
  static List<ChatModel> _chatList = [];

  static List<ChatModel> getChats() {
    if (_chatList.isEmpty) {
      for (int i = 0; i < names.length; i++) {
        _chatList.add(ChatModel(
            userName: names[i],
            userId: 'userId $i',
            avatarUrl: 'https://placeimg.com/256/256/selfie/$i',
            lastMessage: 'last message $i. hello world!',
            timestamp: DateTime.now().millisecondsSinceEpoch - i * 92978));
      }
    }

    return _chatList;
  }

  static void updateChats() async {}

  static bool sendMessage(MessageModel message) {
    message.printMessage(tag: 'sendMessage');
    return true;
  }

  static void receivedMessage(MessageModel message) {
    message.printMessage(tag: 'receivedMessage');
  }
}
