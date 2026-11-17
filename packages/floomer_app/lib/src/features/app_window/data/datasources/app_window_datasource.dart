import 'package:floomer/src/core/platform/floomer_method_channel.dart';

abstract interface class AppWindowDataSource {
  Future<void> showWindow();
  Future<void> openScreenRecordingSettings();
  Future<void> closeApp();
}

class const MethodChannelAppWindowDataSource({
  required final FloomerMethodChannel _channel,
}) implements AppWindowDataSource {
  @override
  Future<void> showWindow() {
    return _channel.showWindow();
  }

  @override
  Future<void> openScreenRecordingSettings() {
    return _channel.openScreenRecordingSettings();
  }

  @override
  Future<void> closeApp() {
    return _channel.closeApp();
  }
}
