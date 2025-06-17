import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/common/values/constants.dart';
import 'package:student_cabinet_app/common/widgets/default_app_bar.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/regular_text.dart';
import 'package:student_cabinet_app/main.dart';
import 'package:student_cabinet_app/pages/main_menu/bloc/main_menu_bloc.dart';
import 'package:student_cabinet_app/pages/main_menu/content/menu_block_element.dart';
import 'package:student_cabinet_app/common/widgets/user_icon.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreen();
}

class _MainMenuScreen extends State<MainMenuScreen> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: _initAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: BlocSelector<MainMenuBloc, MainMenuState, String>(
                    selector: (state) => state.userName,
                    builder: (context, name){
                    return UserIcon(name);
                  }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h, bottom: 100.h),
                child: const _MenuTile(),
              ),
            ]
          ),
      )
  );

  @override
  void dispose(){
    super.dispose();
  }

  PreferredSizeWidget _initAppBar(){
    return DefaultAppBar(
      titleText: "Меню",
      enableBottomLine: true,
      actions:  [
        IconButton(
          onPressed: (){
            navigatorKey.currentState?.pushNamed(AppRoutes.settings);
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

class _MenuTile extends StatelessWidget {
  const _MenuTile();

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
        width: 24.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("Расписание"),
              Row(
                children: [
                  MenuBlockElement(
                    AppConstants.menuBlockButtons["schedule"]!,
                    height: 135.h,
                    width: 135.w,
                  ),
                  MenuBlockElement(
                    AppConstants.menuBlockButtons["schedule_update"]!,
                    height: 135.h,
                    width: 135.w,
                  )
                ]
              ),
              _buildSectionHeader("Документы"),
              MenuBlockElement(
                AppConstants.menuBlockButtons["doc_list"]!,
                width: 310.w,
                heightPadding: 20.h,
                height: 135.h,
              ),
              MenuBlockElement(
                AppConstants.menuBlockButtons["order"]!,
                width: 310.w,
                heightPadding: 20.h,
                height: 135.h,
              )
            ]
        )
    );
  }

  Widget _buildSectionHeader(String name){
    return Padding(
      padding: EdgeInsets.only(top: 34.w, bottom: 7.w),
      child: RegularText(
        text: name,
        size: 15.sp,
        color: Colors.lightBlue,
        bold: true,
      )
    );
  }
}