import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/core/constants/app_colors.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController messageController;
  final VoidCallback onSend;

  const ChatInputField({
    Key? key,
    required this.messageController,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(top: BorderSide(color: AppColors.salmon)),
      ),
      child: Row(
        children: [

          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {

            },
          ),


          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                fillColor: AppColors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          const SizedBox(width: 8),

          IconButton(
            icon: Icon( Icons.mic, color: AppColors.salmon),
            onPressed: onSend,
          ),
          IconButton(
            icon: Icon(Icons.send, color: AppColors.salmon),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
