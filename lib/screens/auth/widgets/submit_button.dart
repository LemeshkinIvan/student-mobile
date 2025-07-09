import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/widgets/circular_loader.dart';
import 'package:student_cabinet_app/screens/auth/bloc/auth_bloc.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({super.key});

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
              child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state){
                return ElevatedButton(
                  onPressed: state.enableSubmitButton ? (){
                    context.read<AuthBloc>().add(const LoginSubmitEvent());
                  } : null, 
                  style: ButtonStyle(
                     backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent)
                    ),
                    child: state.enableSubmitButton ? const Text("ВОЙТИ") : const CircularLoader()
                  );
              })
          )
        ],
      )
    );
  }
}