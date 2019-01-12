import 'package:chameleonapp/whatsapp/model/buddy_model.dart';
import 'package:chameleonapp/whatsapp/model/app_data.dart';
import 'package:chameleonapp/util/time_util.dart';

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
