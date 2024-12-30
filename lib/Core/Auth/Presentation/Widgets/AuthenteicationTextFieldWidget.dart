import 'package:flutter/material.dart';
import '../../../../Responsive/ui_component/info_widget.dart';

// ignore: must_be_immutable
class AuthenticationTextFieldWidget extends StatefulWidget {
  String title;
  bool isPassword;
  TextEditingController? TxtController;
  AuthenticationTextFieldWidget({super.key, this.isPassword = false, required this.title, this.TxtController});

  @override
  State<AuthenticationTextFieldWidget> createState() => _AuthenticationTextFieldWidgetState();
}

class _AuthenticationTextFieldWidgetState extends State<AuthenticationTextFieldWidget> {
  bool passInvisible = true;

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceinfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: deviceinfo.screenWidth * 0.035, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: deviceinfo.screenHeight * 0.01,),
            TextField(
              controller: widget.TxtController,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.grey, width: deviceinfo.screenWidth*0.001),
                  borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.02),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.grey, width: deviceinfo.screenWidth*0.001),
                  borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.02),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.grey, width: deviceinfo.screenWidth*0.001),
                  borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.02),
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                  color: Colors.grey,
                  icon: Icon(passInvisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passInvisible = !passInvisible;
                    });
                  },
                )
                    : null,
              ),
              textInputAction: TextInputAction.next,
              obscureText: widget.isPassword ? passInvisible : false,
            ),
          ],
        );
      },
    );
  }
}