import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:student_cabinet_app/common/enums/server_urls.dart';
import 'package:student_cabinet_app/common/values/constants.dart';

class AppManager {
  static late String _appName;
  static late String _buildVersion;
  static late String _appVersion;
  static String serverUrlApi = AppConstants.devServerApiUrl;
  static late String currentPlatform;

  static Future<void> init() async {
    var info = await PackageInfo.fromPlatform();

    _buildVersion = info.buildNumber;
    _appVersion = info.version;
  }

  static String get appName {
    return _appName;
  }

  static String get buildVersion {
    return _buildVersion;
  }

  static String get appVersion {
    return _appVersion;
  }

  static void setServerUrl(ServerUrls type){
    serverUrlApi = type.displayName;
  }

  static String formatTimeStampToDateTime(String value){
    var utcDate = DateTime.parse(value);
    var formatter = DateFormat('dd MMMM yyyy HH:mm', 'ru_RU');
    return formatter.format(utcDate);
  }
}