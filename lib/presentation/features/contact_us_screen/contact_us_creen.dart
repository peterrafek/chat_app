import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/routes_manager/routes.dart';
import 'package:flutter_task/presentation/features/help_screen/widgets/divider_line.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColors.black),

        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Text(
            "Help & FAQS",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.salmon),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              " How Can We Help You?",
              style: AppStyles.bodyStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            DividerLine(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.beige,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.helpScreenRoute);
                      },
                      child: Text("FAQ"),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.salmon,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text("Contact Us"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildContactTile(
              name: "Customer Service",
              icon: Icons.call_outlined,
              onTap: () async {
                try {
                  final Uri url = Uri.parse("tel:+201234567890");
                  if (!await launchUrl(url)) {
                    print(" Couldn't launch URL");
                  }
                } catch (e) {
                  print("Error launching URL: $e");
                }
              },
            ),
            SizedBox(height: 20),
            buildContactTile(
              name: "Website",
              icon: Icons.sports_volleyball_outlined,
              onTap: () async {
                try {
                  final Uri url = Uri.parse("https://www.example.com");
                  if (!await launchUrl(url)) {
                    print(" Couldn't launch URL");
                  }
                } catch (e) {
                  print("Error launching URL: $e");
                }
              },
            ),

            SizedBox(height: 20),
            buildContactTile(
              name: "Facebook",
              icon: Icons.facebook,
              onTap: () async {
                try {
                  final Uri url = Uri.parse(
                    "https://www.facebook.com/yourpage",
                  );
                  if (!await launchUrl(url)) {
                    print(" Couldn't launch URL");
                  }
                } catch (e) {
                  print("Error launching URL: $e");
                }
              },
            ),

            SizedBox(height: 20),
            buildContactTile(
              name: "Whatsapp",
              icon: Icons.circle,
              onTap: () async {
                try {
                  final Uri url = Uri.parse("https://wa.me/201234567890");
                  if (!await launchUrl(url)) {
                    print(" Couldn't launch URL");
                  }
                } catch (e) {
                  print("Error launching URL: $e");
                }
              },
            ),
            SizedBox(height: 20),

            buildContactTile(
              name: "Instagram",
              icon: Icons.camera_alt_outlined,
              onTap: () async {
                try {
                  final Uri url = Uri.parse(
                    "https://www.instagram.com/yourusername",
                  );
                  if (!await launchUrl(url)) {
                    print(" Couldn't launch URL");
                  }
                } catch (e) {
                  print("Error launching URL: $e");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContactTile({
    required String name,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ExpansionTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.salmon,
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(name, style: AppStyles.bodyStyle),
      children: [ListTile(title: Text("Open $name"), onTap: onTap)],
    );
  }
}
