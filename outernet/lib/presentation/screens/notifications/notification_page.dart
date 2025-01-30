import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:outernet/presentation/screens/notifications/noti_service.dart';


class NotificationPage extends StatefulWidget {
  final WebSocketService webSocketService;

  const NotificationPage({Key? key, required this.webSocketService}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationMessage> _notifications = [];

  @override
  void initState() {
    super.initState();
    // _setupWebSocketListener();
  }

  // void _setupWebSocketListener() {
  //   widget.webSocketService.subscribeToNotifications((String message) {
  //     final data = json.decode(message);
  //     final notification = NotificationMessage.fromJson(data);
  //     setState(() {
  //       _notifications.insert(0, notification); // Thêm thông báo mới vào đầu danh sách
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
      ),
      body: _notifications.isEmpty
          ? const Center(child: Text('Không có thông báo'))
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return ListTile(
                  leading: const Icon(Icons.notifications, color: Colors.blue),
                  title: Text(notification.fullMessage),
                  subtitle: Text('Địa điểm: ${notification.siteName}'),
                  onTap: () {
                    // Xử lý khi nhấn vào thông báo (ví dụ: điều hướng đến chi tiết địa điểm)
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SiteDetailPage(siteId: notification.siteId),
                    //   ),
                    // );
                  },
                );
              },
            ),
    );
  }
}


class NotificationMessage {
  final int notificationId;
  final int siteId;
  final String siteName;
  final String fullMessage;
  final String userName;
  final String message;
  final int userId;

  NotificationMessage({
    required this.notificationId,
    required this.siteId,
    required this.siteName,
    required this.fullMessage,
    required this.userName,
    required this.message,
    required this.userId,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) {
    return NotificationMessage(
      notificationId: json['notificationId'],
      siteId: json['siteId'],
      siteName: json['siteName'],
      fullMessage: json['fullMessage'],
      userName: json['userName'],
      message: json['message'],
      userId: json['userId'],
    );
  }
}
