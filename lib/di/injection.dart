import 'package:get_it/get_it.dart';
import 'package:student_cabinet_app/data/api/auth_api.dart';
import 'package:student_cabinet_app/common/utils/http_util.dart';
import 'package:student_cabinet_app/data/api/documents_api.dart';
import 'package:student_cabinet_app/data/api/news_api.dart';
import 'package:student_cabinet_app/data/api/schedule_api.dart';
import 'package:student_cabinet_app/data/api/updating_api.dart';
import 'package:student_cabinet_app/data/repository/auth_repository_impl.dart';
import 'package:student_cabinet_app/data/repository/document_repository_impl.dart';
import 'package:student_cabinet_app/data/repository/main_menu_repository_impl.dart';
import 'package:student_cabinet_app/data/repository/news_repository_impl.dart';
import 'package:student_cabinet_app/data/repository/schedule_repository_impl.dart';
import 'package:student_cabinet_app/data/repository/updating_repository_impl.dart';
import 'package:student_cabinet_app/domain/repository/auth_repository.dart';
import 'package:student_cabinet_app/domain/repository/document_repository.dart';
import 'package:student_cabinet_app/domain/repository/main_menu_repository.dart';
import 'package:student_cabinet_app/domain/repository/news_repository.dart';
import 'package:student_cabinet_app/domain/repository/schedule_repository.dart';
import 'package:student_cabinet_app/domain/repository/updating_repository.dart';
import 'package:student_cabinet_app/pages/app_updating/bloc/app_updating_bloc.dart';
import 'package:student_cabinet_app/pages/auth/bloc/auth_bloc.dart';
import 'package:student_cabinet_app/pages/document/bloc/document_bloc.dart';
import 'package:student_cabinet_app/pages/main_menu/bloc/main_menu_bloc.dart';
import 'package:student_cabinet_app/pages/news/bloc/news_bloc.dart';
import 'package:student_cabinet_app/pages/schedule/bloc/schedule_bloc.dart';

class Injection {
  final getIt = GetIt.instance;
  
  Injection.init(){
    _setupNetworkUtilLocator();
    _setupApisLocator();
    _setupBlocsLocator();
    _setupRepositoriesLocator();
  }

  void _setupNetworkUtilLocator(){
    getIt.registerLazySingleton<HttpAuthUtil>(() => HttpAuthUtil());
    getIt.registerLazySingleton<HttpUtil>(() => HttpUtil());
  }

  void _setupApisLocator(){
    getIt.registerLazySingleton<AuthApi>(() => 
      AuthApi(httpUtil: getIt<HttpUtil>(), httpAuthUtil: getIt<HttpAuthUtil>()),
    );

    getIt.registerLazySingleton<ScheduleApi>(() => 
      ScheduleApi(httpUtil: getIt<HttpUtil>(), httpAuthUtil: getIt<HttpAuthUtil>()),
    );

    getIt.registerLazySingleton<DocumentsApi>(() => 
      DocumentsApi(httpUtil: getIt<HttpUtil>(), httpAuthUtil: getIt<HttpAuthUtil>()),
    );

    getIt.registerLazySingleton<NewsApi>(() => 
      NewsApi(httpUtil: getIt<HttpUtil>(), httpAuthUtil: getIt<HttpAuthUtil>()),
    );

    getIt.registerLazySingleton<UpdatingApi>(() => 
      UpdatingApi(httpUtil: getIt<HttpUtil>(), httpAuthUtil: getIt<HttpAuthUtil>()),
    );
  }

  void _setupRepositoriesLocator(){
    getIt.registerLazySingleton<AuthRepository>(() => 
      AuthRepositoryImpl(getIt<AuthApi>()),
    );

    getIt.registerLazySingleton<MainMenuRepository>(() => 
        MainMenuRepositoryImpl(),
    );

    getIt.registerLazySingleton<NewsRepository>(() => 
      NewsRepositoryImpl(getIt<NewsApi>()),
    );

    getIt.registerLazySingleton<UpdatingRepository>(() => 
      UpdatingRepositoryImpl(getIt<UpdatingApi>()),
    );

    getIt.registerLazySingleton<ScheduleRepository>(() => 
      ScheduleRepositoryImpl(getIt<ScheduleApi>()),
    );

    getIt.registerLazySingleton<DocumentRepository>(() => 
        DocumentRepositroryImpl(getIt<DocumentsApi>()),
      );
    }

  void _setupBlocsLocator(){
    getIt.registerLazySingleton<AuthBloc>(() => 
      AuthBloc(getIt<AuthRepository>())
    );

    getIt.registerLazySingleton<MainMenuBloc>(() => 
      MainMenuBloc(getIt<MainMenuRepository>())
    );

    getIt.registerLazySingleton<DocumentBloc>(() => 
      DocumentBloc(getIt<DocumentRepository>())
    );

    getIt.registerLazySingleton<ScheduleBloc>(() => 
      ScheduleBloc(getIt<ScheduleRepository>())
    );

    getIt.registerLazySingleton<NewsBloc>(() => 
      NewsBloc(getIt<NewsRepository>())
    );

    getIt.registerLazySingleton<AppUpdatingBloc>(() => 
      AppUpdatingBloc(getIt<UpdatingRepository>())
    );
  }
}