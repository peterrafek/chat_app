import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/constants/app_colors.dart';
import 'divider_line.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(question, style: AppStyles.bodyStyle),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(answer),
            ),
          ],
        ),
        DividerLine(),
      ],
    );
  }
}
