import 'package:floomer/src/core/platform/floomer_method_channel.dart';
import 'package:floomer/src/features/screenshot/data/models/screen_capture_dto.dart';
import 'package:flutter/services.dart';

abstract interface class ScreenshotDataSource {
  Future<ScreenCaptureDto> captureScreenshot();
}

class const MethodChannelScreenshotDataSource({
  required final FloomerMethodChannel _channel,
}) implements ScreenshotDataSource {
  @override
  Future<ScreenCaptureDto> captureScreenshot() async {
    final payload = await _channel.captureScreenshot();
    if (payload == null) {
      throw PlatformException(
        code: FloomerMethodChannel.noCaptureDataCode,
        message: 'capture_screenshot returned no image data.',
      );
    }

    return .fromMap(payload);
  }
}
