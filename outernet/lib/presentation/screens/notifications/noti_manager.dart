import 'package:flutter/foundation.dart';
import 'package:outernet/presentation/screens/notifications/noti_service.dart';

class WebSocketManager extends ChangeNotifier {
  WebSocketService? _webSocketService;

  WebSocketService? get webSocketService => _webSocketService;

  void initialize(String token, int userId) {
    _webSocketService = WebSocketService(jwtToken: token, userId: userId);
    Future.microtask(() => notifyListeners());
  }

  void disposeWebSocket() {
    _webSocketService?.dispose();
    _webSocketService = null;
    Future.microtask(() => notifyListeners());
  }
}