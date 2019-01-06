import '../model/buddy_model.dart';
import 'chat_service.dart';

class StatusService {
  static List<BuddyModel> _status = [];

  static List<BuddyModel> getAvailableStatus() {
    if (_status.isEmpty) {
      _updateStatus();
    }
    return _status;
  }

  static String _getStatusTime(DateTime time) {
    DateTime now = DateTime.now();
    String result =  now.day == time.day? "Today" : "Yesterday";
    return result + " ${time.hour}:${time.minute}";
  }

  static void _updateStatus() {
    for (int i = 0; i < 4; i++) {
      var b = BuddyModel(ChatService.names[i], _getStatusTime(DateTime.now()),
          'https://placeimg.com/640/480/selfie/$i', 1);

      _status.add(b);
    }
  }
}
