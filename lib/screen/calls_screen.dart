import 'package:flutter/material.dart';
import '../util/custom_wigets.dart';
import '../model/call_log_model.dart';
import '../services/call_service.dart';

class CallsScreen extends StatefulWidget {
  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  List<CallLogModel> _logs;

  @override
  void initState() {
    _logs = CallService.getCallLog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _logs.length,
      itemBuilder: (context, index) =>
          CustomWidgets.getCallLogChild(_logs[index], isEnd: index == _logs.length - 1),
    );
  }
}
