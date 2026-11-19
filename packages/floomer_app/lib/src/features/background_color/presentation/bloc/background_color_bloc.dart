import 'dart:ui' as ui;

import 'package:floomer/src/features/background_color/domain/repositories/background_color_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_color_bloc.freezed.dart';
part 'background_color_event.dart';
part 'background_color_state.dart';

class BackgroundColorBloc({
  required final BackgroundColorRepository _repository,
}) extends Bloc<BackgroundColorEvent, BackgroundColorState> {
  this : super(const .new()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<BackgroundColorState> emit,
  ) {
    final current = _repository.current;
    if (current != null) emit(.new(color: current));

    return emit.forEach(
      _repository.colors,
      onData: (color) => .new(color: color),
      onError: (_, _) => state,
    );
  }
}
