import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:student_cabinet_app/pages/app_updating/app_updating_screen.dart';
import 'package:student_cabinet_app/pages/app_updating/bloc/app_updating_bloc.dart';
import 'package:student_cabinet_app/pages/auth/auth_screen.dart';
import 'package:student_cabinet_app/pages/auth/bloc/auth_bloc.dart';
import 'package:student_cabinet_app/pages/document/bloc/document_bloc.dart';
import 'package:student_cabinet_app/pages/document/list_of_documents/document_library_page.dart';
import 'package:student_cabinet_app/pages/document/document_by_uid/document_viewer.dart';
import 'package:student_cabinet_app/pages/main_menu/bloc/main_menu_bloc.dart';
import 'package:student_cabinet_app/pages/main_menu/service_page.dart';
import 'package:student_cabinet_app/pages/news/bloc/news_bloc.dart';
import 'package:student_cabinet_app/pages/news/news_screen.dart';
import 'package:student_cabinet_app/pages/schedule/bloc/schedule_bloc.dart';
import 'package:student_cabinet_app/pages/schedule/changes/schedule_changes.dart';
import 'package:student_cabinet_app/pages/schedule/static/schedule_page.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const AuthScreen(),
        bloc: BlocProvider.value(value: GetIt.instance<AuthBloc>()),
      ),
      PageEntity(
        route: AppRoutes.service,
        page: const MainMenuScreen(),
         bloc: BlocProvider.value(value: GetIt.instance<MainMenuBloc>()),
      ),
      PageEntity(
        route: AppRoutes.documentLibrary,
        page: const DocumentLibraryPage(),
         bloc: BlocProvider.value(value: GetIt.instance<DocumentBloc>()),
      ),
      PageEntity(
          route: AppRoutes.documentViewer,
          page: const DocumentViewer(),
           bloc: BlocProvider.value(value: GetIt.instance<DocumentBloc>()),
      ),
      PageEntity(
        route: AppRoutes.schedule,
        page: const SchedulePage(),
         bloc: BlocProvider.value(value: GetIt.instance<ScheduleBloc>()),
      ),
      PageEntity(
        route: AppRoutes.updatedSchedule,
        page: const ScheduleChanges(),
        bloc: BlocProvider.value(value: GetIt.instance<ScheduleBloc>()),
      ),
      PageEntity(
        route: AppRoutes.news,
        page: const NewsScreen(),
        bloc: BlocProvider.value(value: GetIt.instance<NewsBloc>()),
      ),
      PageEntity(
        route: AppRoutes.updating,
        page: const AppUpdatingScreen(),
        bloc: BlocProvider.value(value: GetIt.instance<AppUpdatingBloc>()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static PageRoute generateRouteSettings(RouteSettings settings){
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => result.first.page,
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, animation, __, child) {
              const beginOffset =
              Offset(1.0, 0.0); // Slide from right to left
              const endOffset = Offset.zero; // Slide to the center
              var offsetTween =
              Tween<Offset>(begin: beginOffset, end: endOffset);
              var offsetAnimation = animation
                  .drive(CurveTween(curve: Curves.easeInOut))
                  .drive(offsetTween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            settings: settings
        );
      }
    }
    return MaterialPageRoute(
        builder: (_) => const AuthScreen(), settings: settings
    );
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
