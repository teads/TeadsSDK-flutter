class TeadsAdSettings {
  
  String _subjectToGDPR = "";
  String _consent = "";
  TCFVersion _tcfVersion = TCFVersion.V1;
  int _cmpSdkID = 0;
  String usPrivacy = "";

  bool browserUrlHidden;
  bool debugModeEnabled;
  bool lightEndScreenEnabled;
  bool locationEnabled;
  bool mediaPreloadEnabled;
  String publisherSlotUrl;
  bool validationModeEnabled;
  bool crashReporterEnabled;
  
  TeadsAdSettings({
    this.browserUrlHidden = true,
    this.debugModeEnabled = false,
    this.lightEndScreenEnabled = true,
    this.locationEnabled = false,
    this.mediaPreloadEnabled = true,
    this.publisherSlotUrl = "",
    this.usPrivacy,
    this.validationModeEnabled = false,
    this.crashReporterEnabled = true
});
  
  void userConsent(String subject, String consent, TCFVersion tcfVersion, int sdkId) {
    this._subjectToGDPR = subject;
    this._consent = consent;
    this._tcfVersion = tcfVersion;
    this._cmpSdkID = sdkId;
  }

  void pageUrl(String url) {
    this.publisherSlotUrl = url;
  }


  Map<String, dynamic> toMap() {
    return {
      'browserUrlHidden': this.browserUrlHidden,
      'debugModeEnabled': this.debugModeEnabled,
      'lightEndScreenEnabled': this.lightEndScreenEnabled,
      'locationEnabled': this.locationEnabled,
      'mediaPreloadEnabled': this.mediaPreloadEnabled,
      'publisherSlotUrl': this.publisherSlotUrl,
      'validationModeEnabled': this.validationModeEnabled,
      'crashReporterEnabled': this.crashReporterEnabled,

      'subjectToGDPR': this._subjectToGDPR,
      'consent': this._consent,
      'tcfVersion': this._tcfVersion.value,
      'cmpSdkID': this._cmpSdkID,
      'usPrivacy': this.usPrivacy,
    };
  }
}

enum TCFVersion {
  V1,
  V2
}

extension TCFVersionExt on TCFVersion {
  int get value {
    switch (this) {
      case TCFVersion.V1:
        return 1;
      case TCFVersion.V2:
        return 2;
      default:
        return 1;
    }
  }
}