// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:untitled_diplom/common/values/colors.dart';
// import 'package:untitled_diplom/pages/auth/bloc/auth_cubit.dart';
//
// Future<bool?> toastInfo({required String msg, Color bgColor = AppColors.white,
//   Color textColor = AppColors.textReserve}) {
//   return Fluttertoast.showToast(
//     msg: msg,
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 2,
//     backgroundColor: bgColor,
//     textColor: textColor,
//     fontSize: 14.sp,
//   );
// }
//
// // for all platform
// void toastWithContext(BuildContext context, {required String msg, Pages? page}){
//   FToast fToast = FToast();
//   fToast.init(context);
//
//   Widget toast = Container(
//     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(17.r),
//       color: AppColors.lightGrey,
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(msg),
//       ],
//     ),
//   );
//
//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.BOTTOM,
//     toastDuration: const Duration(seconds: 2),
//   );
//
//   if (page != null){
//     switch(page){
//       case Pages.auth:
//         context.read<AuthCubit>().showToast(false);
//       case Pages.menu:
//       // context.read<AuthCubit>().showToast(false);
//       case Pages.staticSchedule:
//       //context.read<AuthCubit>().showToast(false);
//       case Pages.updatedSchedule:
//         // context.read<SelectedOperationCubit>().showToast(false);
//     }
//   }
// }