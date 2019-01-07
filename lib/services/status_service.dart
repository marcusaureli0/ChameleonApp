import '../model/buddy_model.dart';
import '../model/app_data.dart';
import '../util/time_util.dart';

class StatusService {
  static List<BuddyModel> _status = [];

  static List<BuddyModel> getAvailableStatus() {
    if (_status.isEmpty) {
      _updateStatus();
    }
    return _status;
  }

  static void _updateStatus() {
    for (int i = 0; i < 4; i++) {
      var b = BuddyModel(names[i], TimeUtil.getChatTime(DateTime.now().microsecondsSinceEpoch, true),
          'https://placeimg.com/256/256/selfie/$i', 1);

      _status.add(b);
    }
  }
}
