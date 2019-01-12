import 'package:flutter/material.dart';
import 'package:chameleonapp/whatsapp/controller/widget_controller.dart';
import 'package:chameleonapp/whatsapp/model/call_log_model.dart';
import 'package:chameleonapp/whatsapp/services/call_service.dart';

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
          WidgetController().getCallLogChild(_logs[index], isEnd: index == _logs.length - 1),
    );
  }
}
