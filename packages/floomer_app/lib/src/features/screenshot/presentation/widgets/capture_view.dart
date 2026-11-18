import 'dart:ui' as ui;

import 'package:floomer/src/features/screenshot/domain/entities/screenshot.dart';
import 'package:material_ui/material_ui.dart';

class const CaptureView({
  required final Screenshot screenshot,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawImage(
      image: screenshot.image,
      scale: screenshot.scale,
      filterQuality: ui.FilterQuality.none,
    );
  }
}
