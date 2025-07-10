import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/screens/app_updating/app_updating_screen.dart';
import 'package:student_cabinet_app/screens/app_updating/bloc/app_updating_bloc.dart';
import 'package:student_cabinet_app/screens/auth/auth_screen.dart';
import 'package:student_cabinet_app/screens/auth/bloc/auth_bloc.dart';
import 'package:student_cabinet_app/screens/document/bloc/document_bloc.dart';
import 'package:student_cabinet_app/screens/document/list_of_documents/document_library_screen.dart';
import 'package:student_cabinet_app/screens/document/viewing_a_document/document_viewer.dart';
import 'package:student_cabinet_app/screens/main_menu/cubit/main_menu_cubit.dart';
import 'package:student_cabinet_app/screens/main_menu/main_menu_screen.dart';
import 'package:student_cabinet_app/screens/news/bloc/news_bloc.dart';
import 'package:student_cabinet_app/screens/news/news_screen.dart';
import 'package:student_cabinet_app/screens/schedule/bloc/schedule_bloc.dart';
import 'package:student_cabinet_app/screens/schedule/changes/schedule_changes.dart';
import 'package:student_cabinet_app/screens/schedule/static/schedule_page.dart';


class AppScreens {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.initial,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<AuthBloc>(),
            child: const AuthScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.service,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<MainMenuCubit>(),
            child: const MainMenuScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.documentLibrary,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<DocumentBloc>(),
            child: const DocumentLibraryScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.documentViewer,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<DocumentBloc>(),
            child: const DocumentViewer(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.schedule,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<ScheduleBloc>(),
            child: const SchedulePage(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.updatedSchedule,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<ScheduleBloc>(),
            child: const ScheduleChanges(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.news,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<NewsBloc>(),
            child: const NewsScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.updating,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => GetIt.instance<AppUpdatingBloc>(),
            child: const AppUpdatingScreen(),
          );
        },
      )
    ]
  );
}