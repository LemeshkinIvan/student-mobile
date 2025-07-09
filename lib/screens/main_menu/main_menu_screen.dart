import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/common/widgets/default_app_bar.dart';
import 'package:student_cabinet_app/screens/main_menu/bloc/main_menu_cubit.dart';
import 'package:student_cabinet_app/screens/main_menu/widgets/menu_tiles/buttons_container.dart';
import 'package:student_cabinet_app/common/widgets/user_icon.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreen();
}

class _MainMenuScreen extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: _initAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35.h),
              child: BlocBuilder<MainMenuCubit, MainMenuState>(
                builder: (context, state){
                  return UserIcon(state.userName);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.h, bottom: 100.h),
              child: const ButtonsContainer(),
            ),
          ]
        ),
      )
  );

  PreferredSizeWidget _initAppBar(){
    return DefaultAppBar(
      titleText: "Меню",
      enableBottomLine: true,
      actions:  [
        IconButton(
          onPressed: (){
            context.go(AppRoutes.settings);
          },
          icon: const Icon(
              Icons.settings,
              color: Colors.blueAccent
          )
        )
      ],
    );
  }
}

