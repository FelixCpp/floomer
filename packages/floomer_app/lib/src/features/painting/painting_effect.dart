import 'package:floomer/src/features/mirroring/mirroring_controller.dart';
import 'package:floomer/src/features/mirroring/mirroring_scope.dart';
import 'package:floomer/src/features/painting/painting_controller.dart';
import 'package:floomer/src/features/painting/painting_scope.dart';
import 'package:flutter/widgets.dart';

class const PaintingEffect({
  super.key,
  required final TransformationController transformationController,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _Painter(
        paintingController: PaintingScope.of(context, listen: false),
        mirroringController: MirroringScope.of(context, listen: false),
        transformationController: transformationController,
      ),
      child: child,
    );
  }
}

class _Painter({
  required final PaintingController paintingController,
  required final MirroringController mirroringController,
  required final TransformationController transformationController,
}) extends CustomPainter {
  this
    : super(
        repaint: Listenable.merge([
          paintingController,
          mirroringController,
          transformationController,
        ]),
      );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = .stroke
      ..strokeJoin = .round
      ..strokeCap = .round
      ..strokeWidth = 4
      ..color = .fromARGB(255, 255, 0, 0);

    final imageToScreen =
        transformationController.value * mirroringController.matrix;

    canvas.save();
    canvas.transform(imageToScreen.storage);

    for (final stroke in paintingController.strokes) {
      if (stroke.isEmpty) {
        continue;
      }

      if (stroke.length == 1) {
        canvas.drawPoints(.points, stroke, paint);
        continue;
      }

      final path = Path()..moveTo(stroke[0].dx, stroke[0].dy);

      for (var i = 1; i < stroke.length; ++i) {
        final point = stroke[i];
        path.lineTo(point.dx, point.dy);
      }

      canvas.drawPath(path, paint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    return paintingController != oldDelegate.paintingController ||
        mirroringController != oldDelegate.mirroringController ||
        transformationController != oldDelegate.transformationController;
  }
}
