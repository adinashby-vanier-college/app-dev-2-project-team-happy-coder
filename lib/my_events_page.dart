import 'package:flutter/material.dart';

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  final List<Map<String, String>> events = [
    {
      "title": "Basketball Game",
      "category": "Sports",
      "date": "april 20, 2026",
    },
    {
      "title": "Study Group - Math",
      "category": "Education",
      "date": "september 22, 2026",
    },
    {
      "title": "Evening Social Meetup",
      "category": "Social",
      "date": "Mars 25, 2026",
    },
  ];

  void editEvent(int index) {
    final titleController =
    TextEditingController(text: events[index]["title"]);
    final categoryController =
    TextEditingController(text: events[index]["category"]);
    final dateController =
    TextEditingController(text: events[index]["date"]);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Event"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Category"),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: "Date"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                events[index] = {
                  "title": titleController.text,
                  "category": categoryController.text,
                  "date": dateController.text,
                };
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Events"),
        centerTitle: true,
      ),
      body: events.isEmpty
          ? const Center(
        child: Text(
          "No events yet",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
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
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => editEvent(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        events.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

