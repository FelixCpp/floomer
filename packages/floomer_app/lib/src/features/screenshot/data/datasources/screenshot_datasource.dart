import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/screenshot/data/models/screen_capture_model.dart';
import 'package:flutter/services.dart';

abstract interface class ScreenshotDataSource {
  Future<ScreenCaptureModel> captureDisplayUnderCursor();
}

class const MethodChannelScreenshotDataSource({
  required final FloomerMethodChannel _channel,
}) implements ScreenshotDataSource {
  @override
  Future<ScreenCaptureModel> captureDisplayUnderCursor() async {
    final payload = await _channel.captureScreenshot();
    if (payload == null) {
      throw PlatformException(
        code: FloomerMethodChannel.noCaptureDataCode,
        message: 'capture_screenshot returned no image data.',
      );
    }

    return ScreenCaptureModel.fromMap(payload);
  }
}
