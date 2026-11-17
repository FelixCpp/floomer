import 'package:flutter/services.dart';

class const FloomerMethodChannel({
  final MethodChannel _channel = _defaultChannel,
}) {
  static const MethodChannel _defaultChannel = MethodChannel(
    'com.example.floomer/native',
  );

  static const String permissionDeniedCode = 'permission_denied';
  static const String noDisplayCode = 'no_display';
  static const String conversionFailedCode = 'conversion_failed';
  static const String noCaptureDataCode = 'no_capture_data';

  Future<Map<String, Object?>?> captureScreenshot() {
    return _channel.invokeMapMethod<String, Object?>('capture_screenshot');
  }

  Future<void> showWindow() {
    return _channel.invokeMethod<void>('show_window');
  }

  Future<void> openScreenRecordingSettings() {
    return _channel.invokeMethod<void>('open_screen_recording_settings');
  }

  Future<void> closeApp() {
    return _channel.invokeMethod<void>('close_app');
  }
}
