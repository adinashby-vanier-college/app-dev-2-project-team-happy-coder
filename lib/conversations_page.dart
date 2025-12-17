import 'package:flutter/material.dart';
import 'package:happycoder_project/theme/app_colors.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> conversations = [
      {
        "name": "Alexander",
        "lastMessage": "Im excited for todays game!",
        "time": "10:45 AM"
      },
      {
        "name": "Xiaobo",
        "lastMessage": "What should i bring?",
        "time": "Yesterday"
      },
      {
        "name": "Nan",
        "lastMessage": "Can you send the notes?",
        "time": "Mon"
      },
      {
        "name": "Sebastian",
        "lastMessage": "Let's plan for the event.",
        "time": "Sun"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversations"),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.chatBg,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: conversations.length,
          itemBuilder: (context, index) {
            final convo = conversations[index];

            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(convo["name"]!),
                subtitle: Text(convo["lastMessage"]!),
                trailing: Text(
                  convo["time"]!,
                  style:
                  const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/chat');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
