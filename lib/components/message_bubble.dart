import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.sender,
    required this.text,
    required this.isMe,
    required this.time,
  }) : super(key: key);

  final String sender;
  final String text;
  final bool isMe;
  final Timestamp time;

  String getTime() {
    int hours = time.toDate().hour;
    int minutes = time.toDate().minute;
    String partOfTheDay;

    if (hours < 12) {
      if (hours == 0) hours = 12;
      partOfTheDay = 'AM';
    } else {
      hours -= 12;
      if (hours == 0) hours = 12;
      partOfTheDay = 'PM';
    }

    return "$hours:$minutes $partOfTheDay";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(
              sender,
              style: const TextStyle(fontSize: 12.0, color: Colors.black54),
            ),
          ),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: isMe ? Colors.white : Colors.black87,
                    ),
                  ),
                  Text(
                    getTime(),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: isMe ? Colors.white70 : Colors.black38,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
