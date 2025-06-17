import 'package:flutter/material.dart';
import 'package:student_cabinet_app/common/values/colors.dart';

buildDefaultModal(BuildContext context, Widget child) {
  showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, a1, a2) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                child: AlertDialog(
                  insetPadding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  contentPadding: EdgeInsets.zero,
                  surfaceTintColor: AppColors.white,
                  content: IntrinsicHeight(
                      child:
                      Padding(padding: const EdgeInsets.all(10), child: child)),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none),
                )));
      });
}
