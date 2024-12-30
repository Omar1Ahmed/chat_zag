import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String userName;
  final String lastMessage;
  const ChatTile({
    super.key,
    required this.userName,
    required this.lastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        tileColor: const Color.fromARGB(255, 222, 222, 222),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/user.png'),
        ),
        title: Text(
          userName,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        subtitle: Text(
          lastMessage,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
        ),
        onTap: () {},
        enabled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
