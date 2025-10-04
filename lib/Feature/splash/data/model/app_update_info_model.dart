class AppUpdateInfoModel {
  final String currentVersion;
  final String lastVersion;
  final String downloadLink;

  AppUpdateInfoModel({
    required this.currentVersion,
    required this.lastVersion,
    required this.downloadLink,
  });

  factory AppUpdateInfoModel.fromJson(Map<String, dynamic> json) {
    return AppUpdateInfoModel(
      currentVersion: json['current_version'] ?? '',
      lastVersion: json['last_version'] ?? '',
      downloadLink: json['download_link'] ?? '',
    );
  }
}
