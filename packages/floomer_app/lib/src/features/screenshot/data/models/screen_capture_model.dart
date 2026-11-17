import 'dart:async';
import 'dart:ui' as ui;

import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:flutter/services.dart';

/// Raw capture payload as it arrives from the platform channel.
class const ScreenCaptureModel({
  /// Raw, premultiplied BGRA8888 pixels.
  required final Uint8List pixels,

  /// Width of the image in pixels.
  required final int width,

  /// Height of the image in pixels.
  required final int height,

  /// Number of bytes per pixel row, which is not necessarily `width * 4`.
  required final int bytesPerRow,

  /// Backing scale factor of the captured display.
  required final double scale,
}) {
  /// Decodes the payload sent by `capture_screenshot`.
  factory fromMap(Map<String, Object?> map) {
    return ScreenCaptureModel(
      pixels: map['pixels']! as Uint8List,
      width: map['width']! as int,
      height: map['height']! as int,
      bytesPerRow: map['bytesPerRow']! as int,
      scale: (map['scale']! as num).toDouble(),
    );
  }

  /// Uploads [pixels] to the GPU. There is no decoding step — the native side
  /// already hands over the exact layout `ui.PixelFormat.bgra8888` expects.
  Future<Screenshot> toEntity() async {
    final completer = Completer<ui.Image>();

    ui.decodeImageFromPixels(
      pixels,
      width,
      height,
      ui.PixelFormat.bgra8888,
      completer.complete,
      rowBytes: bytesPerRow,
    );

    return Screenshot(image: await completer.future, scale: scale);
  }
}
