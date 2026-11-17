import 'dart:ui' as ui;

import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:material_ui/material_ui.dart';

/// Renders the capture at its original size.
class const CaptureView({
  required final Screenshot screenshot,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // `scale` keeps one captured pixel on exactly one device pixel, which is
    // what annotations will rely on.
    return RawImage(
      image: screenshot.image,
      scale: screenshot.scale,
      filterQuality: ui.FilterQuality.none,
    );
  }
}
