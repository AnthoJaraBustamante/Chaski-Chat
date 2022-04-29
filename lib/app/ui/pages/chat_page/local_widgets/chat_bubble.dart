import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isMe,
  }) : super(key: key);
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueAccent : Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isMe ? 15 : 0),
            topRight: const Radius.circular(15),
            bottomLeft: const Radius.circular(15),
            bottomRight: Radius.circular(isMe ? 0 : 15),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
