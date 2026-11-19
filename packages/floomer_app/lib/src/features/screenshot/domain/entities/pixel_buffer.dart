import 'dart:typed_data';

/// Raw BGRA8888 pixels of a capture, for analyzing it on the CPU without
/// reading the image back from the GPU.
///
/// Deliberately not a freezed class: a full-screen capture is tens of
/// megabytes, so equality, hashing and [toString] must not touch [bytes].
class const PixelBuffer({
  required final Uint8List bytes,
  required final int width,
  required final int height,

  /// Number of bytes per pixel row. Not necessarily `width * 4`.
  required final int bytesPerRow,
}) {
  @override
  String toString() => 'PixelBuffer(${width}x$height)';
}
