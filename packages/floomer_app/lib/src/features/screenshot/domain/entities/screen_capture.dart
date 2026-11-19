import 'dart:ui' as ui;

import 'package:floomer/src/features/screenshot/domain/entities/pixel_buffer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_capture.freezed.dart';

@freezed
class ScreenCapture({
  required final ui.Image image,
  required final double scale,
  required final PixelBuffer pixels,
}) with _$ScreenCapture {
  ui.Size get logicalSize {
    return .new(
      image.width / scale,
      image.height / scale,
    );
  }
}
