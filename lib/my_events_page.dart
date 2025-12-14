import 'package:flutter/material.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> events = [
      {
        "title": "Basketball Game",
        "category": "Sports",
        "date": "Mars 20, 2026",
      },
      {
        "title": "Study Group - Math",
        "category": "Education",
        "date": "April 22, 2026",
      },
      {
        "title": "Football Game",
        "category": "Sports",
        "date": "Feb 25, 2026",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Events"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              title: Text(
                event["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${event['category']} • ${event['date']}",
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                print("Selected event: ${event["title"]}");
              },
            ),
          );
        },
      ),
    );
  }
}
