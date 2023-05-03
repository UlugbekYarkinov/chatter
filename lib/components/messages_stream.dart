import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'message_bubble.dart';

class MessagesStream extends StatelessWidget {
  const MessagesStream(this._fireStore, {
    Key? key,
    required this.loggedInUser
  }) : super(key: key);

  final FirebaseFirestore _fireStore;
  final User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fireStore
          .collection('messages')
          .orderBy('ts', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        //AsyncSnapshot -> QuerySnapshot -> List of documents
        final documents = snapshot.data!.docs;
        List<MessageBubble> messageWidgets = [];
        for (var doc in documents) {
          messageWidgets.add(MessageBubble(
            sender: doc['sender'],
            text: doc['text'],
            isMe: loggedInUser.email == doc['sender'],
          ));
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
