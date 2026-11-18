import 'package:floomer/src/features/app_window/domain/repositories/app_window_repository.dart';

class const ShowWindow(final AppWindowRepository _repository) {
  Future<void> call() {
    return _repository.show();
  }
}
