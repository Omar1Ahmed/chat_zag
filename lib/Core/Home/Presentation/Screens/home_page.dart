import 'package:chat_zag/Core/Home/Presentation/widgets/new_post_dialog.dart';
import 'package:chat_zag/Core/Home/Presentation/widgets/post_widget.dart';
import 'package:chat_zag/Responsive/enums/device_type.dart';
import 'package:chat_zag/Responsive/ui_component/info_widget.dart';
import 'package:chat_zag/constants/colors.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, info) {
        if (DeviceType.mobile == info.deviceType ||
            (DeviceType.tablet == info.deviceType &&
                info.orientation == Orientation.portrait)) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    PostWidget(
                      username: 'Marwan',
                      postContent: 'This is a post',
                    ),
                    PostWidget(
                      username: 'Marwan',
                      postContent: 'This is a post',
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return NewPostDialog();
                },
              ),
              backgroundColor: MarwanColors.primaryColor,
              child: Icon(Icons.add),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Chat Zag'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    'Welcome to Chat Zag',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
