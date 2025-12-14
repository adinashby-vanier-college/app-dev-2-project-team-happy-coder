import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> friends = [
      {"name": "Alexander", "status": "Online"},
      {"name": "Xiaobo", "status": "Offline"},
      {"name": "Nan", "status": "Busy"},
      {"name": "Sebastian", "status": "Online"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(friend["name"]!),
              subtitle: Text(friend["status"]!),
              trailing: const Icon(Icons.chat, color: Colors.black),
              onTap: () {
                print("Tapped on ${friend["name"]}");
              },
            ),
          );
        },
      ),
    );
  }
}
