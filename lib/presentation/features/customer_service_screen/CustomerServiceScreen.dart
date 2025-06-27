import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/constants/app_colors.dart';
import 'package:flutter_task/presentation/core/routes_manager/routes.dart';
import 'package:flutter_task/presentation/features/help_screen/widgets/divider_line.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColors.black),

        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Customer Service",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.salmon),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text("Hello! i'm Here To Assist You", style: AppStyles.bodyStyle),
            SizedBox(height: 15),

            DividerLine(),

            SizedBox(height: 15),
            Text(
              " We’re here to help you with any"
              " questions or issues. Choose an option below ",
              style: AppStyles.bodyStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            DividerLine(),

            SizedBox(height: 20),

            buildOptionItem(
              title: " How we can help you",
              subtitle: "Support",
              onTap: () {
                Navigator.pushNamed(context, Routes.chatScreenRoute);
              },
            ),
            SizedBox(height: 20),
            DividerLine(),
            SizedBox(height: 20),
            buildOptionItem(
              title: " Help center",
              subtitle: "General information",
              onTap: () {
                Navigator.pushNamed(context, Routes.helpScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.headingStyle),
            Text(subtitle),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.salmon,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
