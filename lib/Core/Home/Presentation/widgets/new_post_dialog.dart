import 'package:chat_zag/Responsive/ui_component/info_widget.dart';
import 'package:chat_zag/constants/colors.dart';

import 'package:flutter/material.dart';

class NewPostDialog extends StatelessWidget {
  const NewPostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, info) {
      return Theme(
        data: ThemeData(
          dialogBackgroundColor: MarwanColors.secondaryColor,
        ),
        child: AlertDialog(
          title: Text('New Post'),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          content: Container(
            clipBehavior: Clip.antiAlias,
            width: info.screenWidth * 0.9,
            height: info.screenHeight * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: MarwanColors.secondaryColor),
            child: Form(
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter your post here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            MaterialButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.red,
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.of(context).pop()),
            MaterialButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: MarwanColors.primaryColor,
                child: Text(
                  'Post',
                  style: TextStyle(color: MarwanColors.textColor),
                ),
                onPressed: () {}),
          ],
        ),
      );
    });
  }
}
