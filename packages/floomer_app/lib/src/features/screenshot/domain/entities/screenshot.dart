import 'dart:ui' as ui;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'screenshot.freezed.dart';

/// A captured screen, already uploaded to the GPU.
///
/// The [image] is owned by the repository that produced it, not by whoever
/// holds this entity.
@freezed
class Screenshot({
  required final ui.Image image,
  required final double scale,
}) with _$Screenshot {
  /// Size of the captured area in logical pixels (points).
  ///
  /// Rendering [image] at [scale] maps one captured pixel to exactly one
  /// device pixel.
  ui.Size get logicalSize => ui.Size(image.width / scale, image.height / scale);
}
