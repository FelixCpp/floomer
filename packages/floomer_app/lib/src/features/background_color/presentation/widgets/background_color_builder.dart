import 'dart:math' as math;

import 'package:floomer/src/features/background_color/presentation/bloc/background_color_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_ui/material_ui.dart';

/// Builds [builder] with a background color derived from the latest
/// screenshot, fading over whenever it changes.
///
/// The primary color itself is too loud behind the screenshot, so it is
/// toned down to a dark, muted variant of the same hue.
class const BackgroundColorBuilder({
  required final ValueWidgetBuilder<Color> builder,
  final Widget? child,
  super.key,
}) extends StatelessWidget {
  static const Duration _fadeDuration = Duration(milliseconds: 400);

  /// Upper bound for the lightness of the background in HCT, from 0 (black)
  /// to 100 (white). Darker colors, like the initial black, are kept as is.
  static const double _maxTone = 15;

  /// Upper bound for how colorful the background may get.
  static const double _maxChroma = 24;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackgroundColorBloc, BackgroundColorState>(
      builder: (context, state) {
        final target = _toBackground(state.color);

        return TweenAnimationBuilder<Color?>(
          tween: ColorTween(end: target),
          duration: _fadeDuration,
          curve: Curves.easeOut,
          builder: (context, color, child) {
            return builder(context, color ?? target, child);
          },
          child: child,
        );
      },
    );
  }

  static Color _toBackground(Color primary) {
    final hct = Hct.fromInt(primary.toARGB32());
    final background = Hct.from(
      hct.hue,
      math.min(hct.chroma, _maxChroma),
      math.min(hct.tone, _maxTone),
    );
    return Color(background.toInt());
  }
}
