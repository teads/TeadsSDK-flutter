typedef BuildTeadsAdSettings = void Function(TeadsAdPlacementSettings _);

class TeadsAdPlacementSettings {
  TeadsAdPlacementSettings(BuildTeadsAdSettings build);

  void disableCrashMonitoring() {}

  void disableTeadsAudioSessionManagement() {}

  void enableDebug() {}

  void userConsent(String subjectToGDPR, String consent,
      {TCFVersion tcfVersion = TCFVersion.v2, int cmpSdkID = 0}) {}

  void setUsPrivacy(String consent) {}

  void disableBatteryMonitoring() {}

  void addExtras(String value, String key) {}
}

enum TCFVersion { v1, v2 }

extension TCFVersionExtension on TCFVersion {
  int get value {
    switch (this) {
      case TCFVersion.v1:
        return 1;
      case TCFVersion.v2:
        return 2;
      default:
        return 1;
    }
  }
}
