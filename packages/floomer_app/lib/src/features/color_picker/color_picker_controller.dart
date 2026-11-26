import 'dart:async';

import 'package:floomer/src/features/screenshot/domain/entities/pixel_buffer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum const ColorCode(final String label) {
  hex('Hex'),
  rgb('RGB');

  String format(Color color) {
    final (r, g, b) = color.channels;

    return switch (this) {
      hex => '#${[r, g, b].map(_hexByte).join()}',
      rgb => 'rgb($r, $g, $b)',
    };
  }

  static String _hexByte(int value) =>
      value.toRadixString(16).padLeft(2, '0').toUpperCase();
}

extension ColorChannels on Color {
  (int, int, int) get channels => (
    (r * 255).round(),
    (g * 255).round(),
    (b * 255).round(),
  );
}

class ColorPickerController({required PixelBuffer pixels})
    extends ChangeNotifier {
  static const _copiedDuration = Duration(milliseconds: 1400);

  PixelBuffer _pixels = pixels;
  var _mousePosition = Offset.zero;
  var _isActive = false;
  ({int x, int y})? _pixelPosition;
  ColorCode? _lastCopied;
  Timer? _copiedTimer;

  Offset get mousePosition => _mousePosition;
  bool get isActive => _isActive;
  ColorCode? get lastCopied => _lastCopied;

  Color? get hoveredColor => switch (_pixelPosition) {
    (:final x, :final y) => _peekAt(_pixels, x, y),
    null => null,
  };

  set pixels(PixelBuffer value) {
    if (identical(value, _pixels)) return;

    _pixels = value;
    _notifyIfActive();
  }

  List<Color?>? sampleAround(int radius) {
    if (_pixelPosition case (:final x, :final y)
        when _peekAt(_pixels, x, y) != null) {
      return [
        for (var row = y - radius; row <= y + radius; row++)
          for (var column = x - radius; column <= x + radius; column++)
            _peekAt(_pixels, column, row),
      ];
    }

    return null;
  }

  void setMousePosition(Offset position) {
    _mousePosition = position;
    _notifyIfActive();
  }

  void setImagePosition(Offset position, Size displaySize) {
    if (displaySize.isEmpty) {
      clearImagePosition();
      return;
    }

    _pixelPosition = (
      x: (position.dx / displaySize.width * _pixels.width).floor(),
      y: (position.dy / displaySize.height * _pixels.height).floor(),
    );
    _notifyIfActive();
  }

  void clearImagePosition() {
    if (_pixelPosition == null) return;

    _pixelPosition = null;
    _notifyIfActive();
  }

  void toggle() {
    _isActive = !_isActive;
    notifyListeners();
  }

  Future<void> copy(ColorCode code) async {
    final color = hoveredColor;
    if (!_isActive || color == null) return;

    await Clipboard.setData(.new(text: code.format(color)));

    _lastCopied = code;
    _copiedTimer?.cancel();
    _copiedTimer = Timer(_copiedDuration, () {
      _lastCopied = null;
      notifyListeners();
    });
    notifyListeners();
  }

  @override
  void dispose() {
    _copiedTimer?.cancel();
    super.dispose();
  }

  void _notifyIfActive() {
    if (_isActive) notifyListeners();
  }
}

Color? _peekAt(PixelBuffer pixels, int x, int y) {
  if (x < 0 || y < 0 || x >= pixels.width || y >= pixels.height) return null;

  final offset = y * pixels.bytesPerRow + x * 4;
  final bytes = pixels.bytes;

  return .fromARGB(
    bytes[offset + 3],
    bytes[offset + 2],
    bytes[offset + 1],
    bytes[offset],
  );
}
