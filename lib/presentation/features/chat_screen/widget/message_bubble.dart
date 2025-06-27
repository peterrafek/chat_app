
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/presentation/core/constants/app_colors.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final String senderId;
  final String time;

  const MessageBubble({
    required this.content,
    required this.senderId,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = senderId == 'user1';

    return Column(
      crossAxisAlignment:
      isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Align(
          alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: EdgeInsets.all(12),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: isUser ?AppColors.beige : AppColors.salmon,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(isUser ? 16 : 0),
                bottomRight: Radius.circular(isUser ? 0 : 16),
              ),
            ),
            child: Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: isUser ? 0 : 16, right: isUser ? 16 : 0),
          child: Text(
            time,
            style: TextStyle(fontSize: 10, color:AppColors.black),
          ),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
