import 'package:floomer/src/features/app_window/domain/repositories/app_window_repository.dart';

class const CloseApp({
  required final AppWindowRepository _repository,
}) {
  Future<void> call() => _repository.close();
}
