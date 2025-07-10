import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/text_field.dart';
import 'package:student_cabinet_app/screens/auth/bloc/auth_bloc.dart';

class CodeInput extends StatefulWidget {
  const CodeInput({super.key});

  @override
  State<StatefulWidget> createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      width: 5.w,
      height: 10.h,
      child: CustomTextField(
        onTap: () {},
        isReadOnly: false,
        controller: codeController,
        hint: "Введите 6-ти значный код",
        type: TextInputType.text,
        onSubmit: (_) => onSubmit(),
        onChanged: (value) => onChanged(value),
        filter: null,
        length: 6,
      ),
    );
  }

  onSubmit() => context.read<AuthBloc>().add(const LoginSubmitEvent());

  onChanged(String value) {
    if (value.isNotEmpty) {
      context.read<AuthBloc>().add(SetInputTextEvent(value));
    }
  }
}
