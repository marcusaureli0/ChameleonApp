import 'package:chameleonapp/whatsapp/model/call_log_model.dart';
import 'package:chameleonapp/whatsapp/model/app_data.dart';
import 'package:chameleonapp/util/time_util.dart';

class CallService {
  static List<CallLogModel> _callLog = [];
  static List<CallLogModel> getCallLog() {
    if (_callLog.isEmpty) {
      _updateCallLog();
    }

    return _callLog;
  }

  static _updateCallLog() {
    for (int i = 0; i < 15; i++) {
      CallLogModel cl = CallLogModel(
          names[i],
          TimeUtil.getChatTime(DateTime.now().microsecondsSinceEpoch, true),
          'https://placeimg.com/256/256/selfie/$i',
          i % 2 == 0 ? 0 : 1, i % 2 == 0 ? 0 : 1);

          _callLog.add(cl);
    }
  }
}
