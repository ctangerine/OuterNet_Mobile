import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class WebSocketService {
  String jwtToken;
  int userId;
  late StompClient _stompClient;
  late FlutterLocalNotificationsPlugin _notificationsPlugin;
  bool _isConnected = false;

  static final WebSocketService _instance = WebSocketService._internal();

  factory WebSocketService({required String jwtToken, required int userId}) {
    _instance.jwtToken = jwtToken;
    _instance.userId = userId;
    _instance._setupLocalNotifications();
    _instance._connectToWebSocket();
    return _instance;
  }

  WebSocketService._internal()
      : jwtToken = '',
        userId = 0;

  void _setupLocalNotifications() {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();

    // Cấu hình thông báo trên Android
    const androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInitSettings);

    _notificationsPlugin.initialize(initSettings);
  }

  void _connectToWebSocket() {
    final String socketUrl =
        'http://192.168.110.11:8080/ws?token=$jwtToken';

    _stompClient = StompClient(
      config: StompConfig.sockJS(
        url: socketUrl,
        onConnect: _onConnect,
        onWebSocketError: (error) => logger.e('WebSocket error: $error'),
        onStompError: (frame) => logger.e('STOMP error: ${frame.body}'),
        onDisconnect: (frame) {
          logger.e('Disconnected from WebSocket');
          _isConnected = false;
        },
        heartbeatOutgoing: const Duration(seconds: 10),
        heartbeatIncoming: const Duration(seconds: 10),
        reconnectDelay: const Duration(seconds: 5), // Tự động kết nối lại
      ),
    );

    _stompClient.activate();
  }

  void _onConnect(StompFrame frame) {
    logger.d('Connected to WebSocket: $frame');
    _isConnected = true;
  }

  void subscribeToNotifications(Function(String) onMessageReceived) {
    if (_isConnected) {
      _stompClient.subscribe(
        destination: '/queue/user-$userId',
        callback: (StompFrame message) {
          onMessageReceived(message.body ?? '{}'); // Gửi dữ liệu JSON đến callback
        },
      );
    } else {
      logger.e('Cannot subscribe, WebSocket is not connected.');
    }
  }

  void _showNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(
      0, // ID thông báo
      title,
      body,
      notificationDetails,
    );
  }

  void dispose() {
    _stompClient.deactivate();
  }
}