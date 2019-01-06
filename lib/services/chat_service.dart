import '../model/chat_model.dart';
import '../model/message_model.dart';

class ChatService {
  static List<ChatModel> _chatList = [];

  static List<dynamic> names = [
    'Delores Escobar',
    'Riyad Keith',
    'Emmy Smith',
    'Victor Lake',
    'Anabel Maldonado',
    'Colton Gonzales',
    'Mairead Nicholson',
    'Tiya Butt',
    'Ailish Albert',
    'Iestyn Mcnamara',
    'Ammar Robbins',
    'Kade Spears',
    'Zion Alfaro',
    'Donnell Franklin',
    'Anya Parsons',
    'Areeba Ryan',
    'Aisha Yu',
    'Amiee Zuniga',
    'Lilian Lloyd',
    'Pheobe Ramos',
    'Maisie Rees',
    'Chloe-Louise Sheppard',
    'Edith Rowe',
    'Eddison Kenny',
    'Addie Rossi',
    'Sammy-Jo Whelan',
    'Zacharias Houghton',
    'Kallum Avalos',
    'Maizie Mcghee',
    'Anum Lugo',
    'Siya Villalobos',
    'Reggie Hulme',
    'Prisha Keenan',
    'Amber-Rose Wagstaff',
    'Ivor Hopper',
    'Minahil Zamora',
    'Annabella Mair',
    'Kwame Piper',
    'Doris Ridley',
    'Hallie Hodges',
  ];

  static List<ChatModel> getChats() {
    if (_chatList.isEmpty) {
      for (int i = 0; i < names.length; i++) {
        _chatList.add(ChatModel(
            userName: names[i],
            userId: 'userId $i',
            avatarUrl: 'https://placeimg.com/640/480/selfie/$i',
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
