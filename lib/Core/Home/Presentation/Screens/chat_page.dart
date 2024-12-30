import 'package:chat_zag/Core/Home/Presentation/widgets/build_appbar_chat.dart';
import 'package:chat_zag/Core/Home/Presentation/widgets/build_chat_bubble.dart';
import 'package:chat_zag/Core/Home/Presentation/widgets/build_messenger_input.dart';
import 'package:chat_zag/Responsive/ui_component/info_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return InfoWidget(builder: (context, deviceInfo){
      return Scaffold(
         backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                buildChatBubble(
                  message:
                      "Hey! How are you? It's been a while. How is your travel to UK?",
                  isSender: false,
                  profileImage: 'assets/profile1.jpg',
                ),
                buildChatBubble(
                  message:
                      "It's great. UK is awesome, especially London. New job is good so far! How about you?",
                  isSender: true,
                  profileImage: 'assets/profile2.jpg',
                ),
              ],
            ),
          ),
          buildMessageInput(context),
        ],
      ),
      );

    },);
  }
  
  
  
  
  
  
  }