import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/constants/app_colors.dart';
import 'package:flutter_task/presentation/core/routes_manager/routes.dart';
import 'package:flutter_task/presentation/features/help_screen/widgets/divider_line.dart';
import 'package:flutter_task/presentation/features/help_screen/widgets/faq_Item.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'help_screen_view_model.dart';
import 'widgets/custom_text_field.dart';

class HelpScreen extends StatelessWidget {
  final controller = Get.put(HelpScreenViewModel());
  final List<Map<String, String>> faqList = [
    {
      "question": "How to reset my password?",
      "answer": "Go to settings > reset password and follow the instructions.",
    },
    {
      "question": "How to contact support?",
      "answer": "Use the Contact Us tab and choose WhatsApp or Facebook.",
    },
    {
      "question": "Can I delete my account?",
      "answer": "Yes, go to Settings > Account > Delete Account.",
    },
    {
      "question": "How do I update my profile information?",
      "answer":
          "Go to your account settings and click on 'Edit Profile' to update your name, email, and other details.",
    },
    {
      "question": "Is my personal data safe?",
      "answer":
          "Yes, we use end-to-end encryption and follow strict security standards to protect your information.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Drawer(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.customerServiceScreenRoute);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),

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
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.select('faq'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:
                              controller.isSelected('faq')
                                  ? AppColors.salmon
                                  : AppColors.beige,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          "FAQ",
                          style: TextStyle(
                            color:
                                controller.isSelected('faq')
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.select('contact');
                        Navigator.pushNamed(
                          context,
                          Routes.contactUsScreenRoute,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:
                              controller.isSelected('contact')
                                  ? AppColors.salmon
                                  : AppColors.beige,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            color:
                                controller.isSelected('contact')
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.salmon,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text("General"),
                  ),
                  SizedBox(width: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.beige,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text("Account"),
                  ),
                  SizedBox(width: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.beige,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text("Services"),
                  ),
                ],
              ),
            ),

            CustomTextField(
              hintText: 'Search',
              onChanged: (value) => controller.updateSearch(value),
            ),
            SizedBox(height: 15),
            DividerLine(),
            SizedBox(height: 15),

            Obx(
              () => Column(
                children:
                    controller.filteredFaqs
                        .map(
                          (faq) => Column(
                            children: [
                              ExpansionTile(
                                title: Text(
                                  faq["question"]!,
                                  style: AppStyles.bodyStyle,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(faq["answer"]!),
                                  ),
                                ],
                              ),
                              DividerLine(),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
