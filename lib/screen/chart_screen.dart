import 'package:chatr_flutter/models/message.dart';
import 'package:chatr_flutter/models/user.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  final User user;

  ChartScreen({this.user});

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = chats[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return buildMessage(message, isMe);
                      }),
                ),
              ),
            ),
            buildMessageComposer()
          ],
        ),
      ),
    );
  }

  Widget buildMessage(Message message, bool isMe) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            margin: isMe
                ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
                : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
            decoration: BoxDecoration(
                color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(message.time,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0)),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  message.text,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
        !isMe
            ? IconButton(
                icon: message.isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                iconSize: 30.0,
                color: message.isLiked
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
                onPressed: () {},
              )
            : SizedBox.shrink(),
      ],
    );
  }

  buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (vslue) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
