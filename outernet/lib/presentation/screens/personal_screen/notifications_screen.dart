import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildDescriptionText(),
                _buildNotificationList(context),
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Thông báo của bạn',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationList(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true, // Add this to make ListView take only the necessary space
          physics: const NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Notification $index'),
              subtitle: Text('This is notification number $index'),
              leading: const Icon(Icons.notifications, color: Colors.blue),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to a detailed page or handle notification tap
              },
            );
          },
        ),
      ],
    );
  }
}