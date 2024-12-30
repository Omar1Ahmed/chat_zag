import 'package:chat_zag/Core/Home/Presentation/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ChatTile(
              lastMessage: 'hello how are you',
              userName: 'marwan',
            ),
            ChatTile(
              lastMessage: 'hello how are you',
              userName: 'marwan',
            ),
          ],
        ),
      ),
    );
  }
}
