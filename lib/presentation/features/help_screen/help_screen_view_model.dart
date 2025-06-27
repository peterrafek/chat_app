import 'package:get/get.dart';

class HelpScreenViewModel extends GetxController {
  var selected = 'faq'.obs;

  var searchQuery = ''.obs;

  final List<Map<String, String>> allFaqs = [
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

  List<Map<String, String>> get filteredFaqs =>
      allFaqs
          .where(
            (faq) => faq['question']!.toLowerCase().contains(
              searchQuery.value.toLowerCase(),
            ),
          )
          .toList();

  void select(String tabName) {
    selected.value = tabName;
  }

  bool isSelected(String tabName) {
    return selected.value == tabName;
  }

  void updateSearch(String query) {
    print("search = $query");
    searchQuery.value = query;
  }
}
