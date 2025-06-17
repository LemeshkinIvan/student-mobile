import 'package:student_cabinet_app/common/values/constants.dart';

enum ServerUrls { dev, prod }

extension PagesExtension on ServerUrls {
  String get displayName {
    switch (this) {
      case ServerUrls.dev:
        return AppConstants.devServerApiUrl;
      case ServerUrls.prod:
        return AppConstants.prodServerApiUrl;
    }
  }

  static ServerUrls? getByDisplayName(String name) {
    return ServerUrls.values.firstWhere(
          (type) => type.displayName == name,
    );
  }

  static String? getDisplayNameByType(ServerUrls type) {
    return type.displayName;
  }
}
