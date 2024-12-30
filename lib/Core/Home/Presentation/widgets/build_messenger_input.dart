  import 'package:chat_zag/constants/colors.dart';
import 'package:flutter/material.dart';

Widget buildMessageInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: 'Say something...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: ColorsManager.greenColor,
            child: IconButton(
              icon: const Icon(Icons.send_sharp),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }