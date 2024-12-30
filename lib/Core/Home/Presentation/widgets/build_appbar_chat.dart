
import 'package:chat_zag/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 2,
    leading: Container(
      margin: const EdgeInsets.all(6),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: ColorsManager.greenColor),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context); 
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    title: Builder(
      builder: (localContext) => Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 3),
            width: 13,
            height: 13,
            decoration: const BoxDecoration(
              color: ColorsManager.greenColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                 
                  Navigator.pushNamed(context,  '/profileScreen');
                 
                },
                child: const Text(
                  '@tomcruise',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Text(
                'Last active: 10 sec ago',
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(179, 19, 18, 18)),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 136, 217, 139),
        ),
        child: const Icon(
          Icons.phone_outlined,
          color: ColorsManager.greenColor,
        ),
      ),
      const SizedBox(width: 30),
    ],
  );
}
