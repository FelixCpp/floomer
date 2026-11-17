abstract interface class AppWindowRepository {
  Future<void> show();
  Future<void> openScreenRecordingSettings();
  Future<void> close();
}
