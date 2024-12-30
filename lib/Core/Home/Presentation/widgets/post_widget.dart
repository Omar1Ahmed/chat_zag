import 'package:chat_zag/Responsive/ui_component/info_widget.dart';
import 'package:chat_zag/constants/colors.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String username;
  final String postContent;
  const PostWidget(
      {super.key, required this.username, required this.postContent});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        double width = deviceInfo.screenWidth;
        double height = deviceInfo.screenHeight;
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          width: width,
          height: height * 0.33,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: MarwanColors.secondaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: MarwanColors.secondaryColor,
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    SizedBox(width: 8),
                    Text(
                      username,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: width,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 229, 229),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    postContent,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
