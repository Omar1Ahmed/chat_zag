import 'package:chat_zag/Core/Home/Presentation/Screens/chats_page.dart';
import 'package:chat_zag/Core/Home/Presentation/Screens/home_page.dart';
import 'package:chat_zag/Core/Home/Presentation/Screens/profile_page.dart';
import 'package:chat_zag/constants/colors.dart';
import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
            backgroundColor: MarwanColors.primaryColor,
            title: const Text(
              'Chat App',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.home_max)),
                Tab(icon: Icon(Icons.person)),
              ],
            )),
        body: TabBarView(
          children: [
            ChatsPage(),
            MyHomePage(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
