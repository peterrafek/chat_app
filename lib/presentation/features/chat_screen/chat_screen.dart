import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/routes_manager/routes.dart';
import 'package:flutter_task/presentation/features/chat_screen/widget/chat_input_field.dart';
import 'package:flutter_task/presentation/features/chat_screen/widget/message_bubble.dart';
import 'package:flutter_task/presentation/features/help_screen/widgets/divider_line.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';
import 'chat_screen_view_model.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:   BackButton(color: AppColors.black)
        ,

        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            "Assistant",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.salmon),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              " I'm Here To Assist You",
              style: AppStyles.bodyStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            DividerLine(),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index];
                    final timestamp = msg['timestamp'] as Timestamp?;
                    final time =
                        timestamp != null
                            ? DateFormat('hh:mm a').format(timestamp.toDate())
                            : '';
                    return MessageBubble(
                      content: msg['content'] ?? '',
                      senderId: msg['senderId'] ?? '',
                      time: time,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            ChatInputField(
              messageController: controller.msgController,
              onSend: () {
                controller.sendMessage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
