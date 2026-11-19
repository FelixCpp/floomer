import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class ColorPickerController({
  required final ui.Image image,
  required final double scale,
}) extends ChangeNotifier {
  var _isActive = false;
  var _isDisposed = false;
  var _screenPosition = Offset.zero;
  Color? _hoveredColor;
  ByteData? _bytes;

  bool get isActive => _isActive;
  Offset get screenPosition => _screenPosition;
  Color? get hoveredColor => _hoveredColor;

  Future<void> load() async {
    final bytes = await image.toByteData(format: .rawStraightRgba);
    if (_isDisposed) return;
    _bytes = bytes;
    notifyListeners();
  }

  void setScreenPosition(Offset position) {
    _screenPosition = position;
    if (_isActive) notifyListeners();
  }

  /// [position] is in logical pixels, relative to the image's top left corner.
  void setImagePosition(Offset position) {
    final color = _colorAt(position * scale);
    if (color == _hoveredColor) return;
    _hoveredColor = color;
    if (_isActive) notifyListeners();
  }

  void clearHoveredColor() {
    if (_hoveredColor == null) return;
    _hoveredColor = null;
    if (_isActive) notifyListeners();
  }

  void toggle() {
    _isActive = !_isActive;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Color? _colorAt(Offset pixel) {
    final bytes = _bytes;
    if (bytes == null) return null;

    final x = pixel.dx.floor();
    final y = pixel.dy.floor();
    if (x < 0 || x >= image.width || y < 0 || y >= image.height) return null;

    final i = (y * image.width + x) * 4;

    return .fromARGB(
      bytes.getUint8(i + 3),
      bytes.getUint8(i),
      bytes.getUint8(i + 1),
      bytes.getUint8(i + 2),
    );
  }
}
