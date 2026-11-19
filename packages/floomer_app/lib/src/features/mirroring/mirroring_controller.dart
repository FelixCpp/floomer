import 'package:flutter/widgets.dart';

class MirroringController extends ChangeNotifier {
  var _matrix = Matrix4.identity();
  var _mousePosition = Offset.zero;

  Matrix4 get matrix => _matrix;

  void setMousePosition(double mouseX, double mouseY) {
    _mousePosition = .new(mouseX, mouseY);
  }

  void toggle() {
    _matrix = _mirrorAt(_mousePosition) * _matrix;
    notifyListeners();
  }

  /// Drops every mirroring back to the unflipped image.
  ///
  /// Mirroring twice at different cursor positions adds up to a translation,
  /// so without this there is no way back to the original orientation.
  void reset() {
    if (_matrix.isIdentity()) return;

    _matrix = Matrix4.identity();
    notifyListeners();
  }
}

Matrix4 _mirrorAt(Offset position) {
  var result = Matrix4.identity();

  result = result * Matrix4.translationValues(position.dx, 0.0, 0.0);
  result = result * Matrix4.diagonal3Values(-1.0, 1.0, 1.0);
  result = result * Matrix4.translationValues(-position.dx, 0.0, 0.0);

  return result;
}
