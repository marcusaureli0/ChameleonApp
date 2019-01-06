import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/chat_model.dart';
import '../services/chat_service.dart';
import '../util/time_util.dart';
//import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> _chats;

  @override
  void initState() {
    super.initState();
    _chats = ChatService.getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) => Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 2.0)),
                ListTile(
                  onTap: () {
                    print(_chats[index].userName);
                  },
                  leading: CircleAvatar(
                    radius: 28.0,
                    backgroundColor: Colors.blue[200],
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundImage: NetworkImage(_chats[index].avatarUrl),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_chats[index].userName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        TimeUtil.getChatTime(_chats[index].timestamp),
                        style: TextStyle(color: Colors.black54, fontSize: 12.0),
                      )
                    ],
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.only(
                        top: 5.0), // espaçamento entre o título e subtítulo
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 2.0)),
                        Text(_chats[index].lastMessage,
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 84.0, top: 2.0),
                  child: Divider(height: 1.0),
                )
              ],
            ),
      ),
    );
  }
}
