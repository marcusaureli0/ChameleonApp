import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../util/custom_wigets.dart';

class StatusScreen extends StatefulWidget {
  final Future<Post> post;

  const StatusScreen({Key key, this.post}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: FutureBuilder<Post>(
          future: widget.post,
          builder: (context, result) {
            if (result.hasData) {
              return CustomWidgets.getTextWidget(
                  'Resultado do get: \n\n${result.data.title}');
            } else if (result.hasError) {
              return CustomWidgets.getTextWidget(result.error.toString());
            }

            // exibe Enquanto fetchPost não é concluído
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
