import 'package:student_cabinet_app/common/dto/menu_block_arguments.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/main.dart';

class AppConstants {
  static const String devServerApiUrl = 'http://192.168.0.100:3000/';
  static const String prodServerApiUrl = 'http://localhost:5000/';

  static const String userData = "userData";
  static const String groupName = 'groupName';

  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String storageDeviceAuthorized = 'isAuthorized';

  static final Uri supportMail = Uri(
    scheme: 'mailto',
    path: 'jablackalicious@gmail.com',
  );

  static final Map<String, MenuBlockArguments> menuBlockButtons = {
    "schedule": MenuBlockArguments(
      onPressed: () {
        navigatorKey.currentState?.pushNamed(AppRoutes.schedule);
      },
      text: "Расписание",
      iconPath: "assets/icons/schedule_static.png",
    ),
    "schedule_update": MenuBlockArguments(
      onPressed: () {
        navigatorKey.currentState?.pushNamed(AppRoutes.updatedSchedule);
      },
      text: "Изменения",
      iconPath: "assets/icons/schedule_updated.webp",
    ),
    "doc_list": MenuBlockArguments(
      onPressed: () {
        navigatorKey.currentState?.pushNamed(AppRoutes.documentLibrary);
      },
      text: "Мои документы",
      iconPath: "assets/icons/document_lib.jpg",
    ),
    "order": MenuBlockArguments(
      onPressed: () {
        navigatorKey.currentState?.pushNamed(AppRoutes.documentOrder);
      },
      text: "Заказать документ",
      iconPath: "assets/icons/order.webp",
    ),
  };
}
