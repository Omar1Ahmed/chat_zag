import 'package:chat_zag/Core/Home/Presentation/widgets/build_state_item.dart';
import 'package:chat_zag/Responsive/ui_component/info_widget.dart';
import 'package:chat_zag/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline, color: Colors.black),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Profile Image
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/tom_cruise.jpg'),
              ),
              const SizedBox(height: 10),
              // Name and Username
              const Text(
                "Tom Cruise",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "@tomcruise",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              // Rating Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0
                          ? ColorsManager.greenColor
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Message and Follow Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: ColorsManager.greenColor,
                      side: const BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.message_outlined),
                    label: const Text("Message"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Follow"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Followers, Posts, Following
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildStatItem("6.3k", "Followers"),
                  buildStatItem("572", "Post"),
                  buildStatItem("2.5k", "Following"),
                ],
              ),
              const SizedBox(height: 20),
              // Photo Containers
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
