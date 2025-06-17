import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/common/values/colors.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/message/default_toast.dart';
import 'package:student_cabinet_app/common/widgets/support_link.dart';
import 'package:student_cabinet_app/common/widgets/text_field.dart';
import 'package:student_cabinet_app/main.dart';
import 'package:student_cabinet_app/common/utils/network_exceptions.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';
import 'package:student_cabinet_app/pages/auth/bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{
  bool isLoading = false;
  bool isEnabled = true;

  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state){
        if (state.userInfo is Data){
          context.read<AuthBloc>().add(NullGetUserInfoStateEvent());
          navigatorKey.currentState?.pushNamed(AppRoutes.service);
        }

        if (state.userInfo is NetworkExceptions){
          String errorMsg = "wtf";
          
          if (state.enableToast){
            context.read<AuthBloc>().add(const AuthEnableToast(false));
            toastInfo(msg: errorMsg);
          }
        }

        if (state.userInfo is Loading){
          setState(() {
            isEnabled = false;
          });
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
                        child: _buildEntryField(),
                      ),
                      const _SubmitButton(),
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


  Widget _buildEntryField(){
    return DefaultPadding (
      width: 5.w, height: 10.h,
      child: CustomTextField(
          onTap: (){},
          isReadOnly: false,
          controller: codeController,
          hint: "Введите 6-ти значный код",
          type: TextInputType.text,
          onChanged: (){},
          filter: null,
          length: 50
      ),
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 5.w
      ),
      child: Row(
        children: [
          Expanded(
              child: BlocSelector<AuthBloc, AuthState, List<dynamic>(
                selector: (state){
                  return [];
                }, 
                builder: (context, args){
                  return ElevatedButton(
                  onPressed: (){
                    if (args[0].isNotEmpty){
                      if (args[0] == '1'){
                        context.read<AuthBloc>().add(GetTokensEvent(args[0]));
                        navigatorKey.currentState?.pushNamed(AppRoutes.service);
                      }
                    } else {
                      toastInfo(msg: "Поле не заполненно");
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all((Colors.lightBlueAccent))
                  ),
                  child: args[1]
                      ? const Text("ВОЙТИ")
                      : const CircularProgressIndicator(
                        color: AppColors.greenDark
                      ),
                  );
                }
              )
          )
        ],
      )
    );
  }
}