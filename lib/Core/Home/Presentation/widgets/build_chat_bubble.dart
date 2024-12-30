  import 'package:flutter/material.dart';

Widget buildChatBubble({
    required String message,
    required bool isSender,
    required String profileImage,
  }) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(profileImage),
            ),
          if (!isSender) const SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: isSender ? Colors.green.shade100 : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isSender ? 20 : 0),
                  topRight: Radius.circular(isSender ? 0 : 20),
                  bottomLeft: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16),
                softWrap: true,
              ),
            ),
          ),
          if (isSender) const SizedBox(width: 10),
          if (isSender)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(profileImage),
            ),
        ],
      ),
    );
  }