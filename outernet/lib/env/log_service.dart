import 'package:logger/logger.dart';
import 'package:outernet/env/config.dart';

class LogService {
  static final LogService _instance = LogService._internal();
  late final Logger _logger;

  LogService._internal() {
    final config = ConfigManager().config;

    Level logLevel;
    switch (config.logLevel) {
      case 'debug':
        logLevel = Level.debug;
        break;
      case 'info':
        logLevel = Level.info;
        break;
      case 'warning':
        logLevel = Level.warning;
        break;
      case 'error':
        logLevel = Level.error;
        break;
      case 'critical':
        logLevel = Level.fatal;
        break;
      default:
        logLevel = Level.off;
    }

    _logger = Logger(
      level: logLevel,
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );
  }

  factory LogService() {
    return _instance;
  }

  Logger get logger => _logger;
}