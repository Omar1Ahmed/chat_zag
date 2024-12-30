import 'package:chat_zag/Core/Home/Presentation/widgets/post_widget.dart';
import 'package:chat_zag/Core/Home/Presentation/widgets/tab_bar.dart';
import 'package:chat_zag/Responsive/enums/device_type.dart';
import 'package:chat_zag/Responsive/ui_component/info_widget.dart';
import 'package:chat_zag/constants/colors.dart';
import 'package:flutter/material.dart';

class ResponsivePlaceHolder extends StatelessWidget {
  const ResponsivePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, info) {
      if (DeviceType.mobile == info.deviceType) {
        return TabBarExample();
      } else if (DeviceType.tablet == info.deviceType) {
        if (info.orientation == Orientation.landscape) {
          double width = info.screenWidth;
          double height = info.screenHeight;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: MarwanColors.primaryColor,
              title: const Text(
                'Chat App',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
              ),
            ),
            body: Row(
              children: [
                Expanded(
                  child: Container(
                    width: width * 0.1,
                    height: height,
                    color: const Color.fromARGB(255, 211, 210, 210),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            enabled: true,
                            iconColor: MarwanColors.primaryColor,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            onTap: () {},
                            title: const Text('Feed'),
                            leading: const Icon(Icons.home_max_sharp),
                          ),
                          ListTile(
                            enabled: true,
                            iconColor: MarwanColors.primaryColor,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            onTap: () {},
                            title: const Text('Chats'),
                            leading: const Icon(Icons.chat),
                          ),
                          ListTile(
                            enabled: true,
                            iconColor: MarwanColors.primaryColor,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            onTap: () {},
                            title: const Text('Profile'),
                            leading: const Icon(Icons.person),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        PostWidget(
                            username: 'marwan', postContent: 'postContent')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return TabBarExample();
        }
      } else {
        return Center(
          child: Text(
            'Can not display on this device',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
    });
  }
}
