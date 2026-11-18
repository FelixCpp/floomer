import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_capture_dto.freezed.dart';

@freezed
class ScreenCaptureDto({
  required final Uint8List pixels,
  required final int width,
  required final int height,
  required final int bytesPerRow,
  required final double scale,
}) with _$ScreenCaptureDto {
  factory fromMap(Map<String, Object?> map) {
    return .new(
      pixels: map['pixels']! as Uint8List,
      width: map['width']! as int,
      height: map['height']! as int,
      bytesPerRow: map['bytesPerRow']! as int,
      scale: map['scale']! as double,
    );
  }
}

// class const ScreenCaptureModel({
//   required final Uint8List pixels,
//   required final int width,
//   required final int height,
//   required final int bytesPerRow,
//   required final double scale,
// }) {
//   factory fromMap(Map<String, Object?> map) {
//     return ScreenCaptureModel(
//       pixels: map['pixels']! as Uint8List,
//       width: map['width']! as int,
//       height: map['height']! as int,
//       bytesPerRow: map['bytesPerRow']! as int,
//       scale: (map['scale']! as num).toDouble(),
//     );
//   }
//
//   Future<Screenshot> toEntity() async {
//     final completer = Completer<ui.Image>();
//
//     ui.decodeImageFromPixels(
//       pixels,
//       width,
//       height,
//       .bgra8888,
//       completer.complete,
//       rowBytes: bytesPerRow,
//     );
//
//     return Screenshot(image: await completer.future, scale: scale);
//   }
// }
