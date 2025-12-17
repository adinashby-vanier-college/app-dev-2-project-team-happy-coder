import 'package:flutter/material.dart';
import 'package:happycoder_project/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String email =
    ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: Container(
        color: AppColors.profileBg,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person, size: 40),
              ),
              const SizedBox(height: 12),
              const Text(
                "Username",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              _menuButton(context, "My Events", "/my_events"),
              _menuButton(context, "Create Event", "/create_event"),
              _menuButton(context, "Friends List", "/friends"),
              _menuButton(context, "Conversations", "/conversations"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(label),
      ),
    );
  }
}
