import 'package:flutter/material.dart';
import 'package:happycoder_project/theme/app_colors.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;

  Future<void> pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Event"),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.eventBg,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Event Title", style: TextStyle(fontSize: 16)),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: "Enter event title",
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Category", style: TextStyle(fontSize: 16)),
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    hintText: "Enter event category",
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Event Date", style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: pickDate,
                  child: Text(
                    selectedDate == null
                        ? "Pick a date"
                        : "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 20),

                const Text("Description", style: TextStyle(fontSize: 16)),
                TextField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Enter description",
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Event Created:");
                      print("Title: ${titleController.text}");
                      print("Category: ${categoryController.text}");
                      print("Date: $selectedDate");
                      print("Description: ${descriptionController.text}");

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Event Created (Placeholder)"),
                        ),
                      );

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Create Event"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
