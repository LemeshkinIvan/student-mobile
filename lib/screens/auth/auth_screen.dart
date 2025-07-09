import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/message/default_toast.dart';
import 'package:student_cabinet_app/common/widgets/support_link.dart';
import 'package:student_cabinet_app/common/utils/network_exceptions.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';
import 'package:student_cabinet_app/screens/auth/bloc/auth_bloc.dart';
import 'package:student_cabinet_app/screens/auth/widgets/code_input.dart';
import 'package:student_cabinet_app/screens/auth/widgets/submit_button.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{
  late AuthBloc bloc;

  @override
  void initState(){
    bloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state){
        if (state.userInfo is Data){
          bloc.add(NullGetUserInfoStateEvent());
          context.go(AppRoutes.service);
        }

        if (state.userInfo is NetworkExceptions){
          String errorMsg = "error";
          
          if (state.enableToast){
            bloc.add(const AuthEnableToast(false));
            toastInfo(msg: errorMsg);
          }
        }
      },
      child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 33.h),
                child: Image.asset("assets/icons/Logo.webp", height: 333.h),
              ),
              DefaultPadding(
                width: 0.w, height: 5.h,
                child: const _WelcomeHeader()
              ),
              Center(
                child: DefaultPadding(
                  width: 35.w, height: 10.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: const CodeInput(),
                      ),
                      const LoginSubmitButton(),
                      Padding(
                        padding: EdgeInsets.only(top: 75.h),
                        child: const SupportLink(),
                      ),
                    ],
                  ),
                )
              )
            ]
          ),
        )
      )
    );
  }
}

class _WelcomeHeader extends StatelessWidget {
  const _WelcomeHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      "ДОБРО ПОЖАЛОВАТЬ!",
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold
      )
    );
  }
}