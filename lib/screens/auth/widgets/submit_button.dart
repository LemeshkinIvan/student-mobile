import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';
import 'package:student_cabinet_app/common/widgets/circular_loader.dart';
import 'package:student_cabinet_app/screens/auth/bloc/auth_bloc.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                Widget child = const Text("ВОЙТИ");

                if ((state.tokensPair is Loading) ||
                    (state.userInfo is Loading)) {
                  child = const CircularLoader();
                }

                return ElevatedButton(
                  onPressed:
                      state.enableSubmitButton
                          ? () {
                            context.read<AuthBloc>().add(
                              const LoginSubmitEvent(),
                            );
                          }
                          : null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      state.enableSubmitButton
                          ? Colors.lightBlueAccent
                          : Colors.grey,
                    ),
                  ),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
