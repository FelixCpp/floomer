import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:floomer/src/features/background_color/domain/repositories/background_color_repository.dart';
import 'package:floomer/src/features/screenshot/domain/entities/pixel_buffer.dart';
import 'package:floomer/src/features/screenshot/domain/entities/screen_capture.dart';
import 'package:floomer/src/features/screenshot/domain/repositories/screenshot_repository.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class BackgroundColorRepositoryImpl({
  required final ScreenshotRepository screenshots,
}) implements BackgroundColorRepository {
  static const int _targetSampleCount = 4000;
  static const int _maxColors = 128;

  final _colors = StreamController<ui.Color>.broadcast();
  late final StreamSubscription<ScreenCapture> _subscription;
  ui.Color? _current;

  /// Incremented per capture, so a slow result can't overwrite a newer one.
  int _generation = 0;

  this {
    // The first capture may already be done before this repository exists.
    final latest = screenshots.current;
    if (latest != null) unawaited(_update(latest));

    _subscription = screenshots.captures.listen(
      (capture) => unawaited(_update(capture)),
    );
  }

  @override
  ui.Color? get current => _current;

  @override
  Stream<ui.Color> get colors => _colors.stream;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    unawaited(_colors.close());
  }

  Future<void> _update(ScreenCapture capture) async {
    final generation = ++_generation;

    try {
      final color = await _primaryColorOf(capture.pixels);
      if (generation != _generation || _colors.isClosed) return;

      _current = color;
      _colors.add(color);
    } catch (error, stackTrace) {
      if (generation != _generation || _colors.isClosed) return;
      _colors.addError(error, stackTrace);
    }
  }

  Future<ui.Color> _primaryColorOf(PixelBuffer pixels) async {
    final samples = _packSamples(pixels);
    final quantized = await QuantizerCelebi().quantize(samples, _maxColors);
    final colorToCount = quantized.colorToCount;

    final mostFrequent = colorToCount.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;

    final ranked = Score.score(
      colorToCount,
      desired: 1,
      fallbackColorARGB: mostFrequent,
    );

    return ui.Color(ranked.first);
  }

  List<int> _packSamples(PixelBuffer pixels) {
    final samples = <int>[];
    final bytes = ByteData.sublistView(pixels.bytes);

    final width = pixels.width;
    final height = pixels.height;

    final step = math.max(
      1,
      math.sqrt(width * height / _targetSampleCount).floor(),
    );

    for (var y = 0; y < height; y += step) {
      for (var x = 0; x < width; x += step) {
        final offset = y * pixels.bytesPerRow + x * 4;
        final argb = bytes.getUint32(offset, Endian.little);
        samples.add(argb);
      }
    }

    return samples;
  }
}
