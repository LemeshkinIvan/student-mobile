import 'package:flutter/material.dart';
import 'package:student_cabinet_app/main.dart';
import '../values/fonts.dart';
import '../values/colors.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String? titleText;
  final bool enableLeading;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  final Color? leadingColor;
  final bool enableBottomLine;

  const DefaultAppBar({
    super.key,
    this.titleText = "",
    this.enableLeading = true,
    this.actions,
    this.onLeadingPressed,
    this.leadingColor,
    required this.enableBottomLine,
  });

  @override
  State<DefaultAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<DefaultAppBar>{
  @override
  Widget build (BuildContext context){
    return AppBar (
      elevation: 0,
      bottom: _returnBottom(),
      actions: widget.actions,
      leading: _returnLeading(),
      title: _initTitle(),
      centerTitle: true,
    );
  }

  PreferredSizeWidget? _returnBottom(){
    return widget.enableBottomLine ? PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        height: 2.0,
        color: AppColors.dividerColor.withOpacity(0.5),
      ),
    ) : null;
  }

  Widget? _returnLeading(){
    Widget exitArrow = IconButton(
      icon: const Icon(
          Icons.arrow_back,
          color: AppColors.black
      ),
      onPressed: (){
        if (widget.onLeadingPressed != null){
          widget.onLeadingPressed!();
        } else {
          navigatorKey.currentState?.pop();
        }
      },
    );

    return widget.enableLeading ? exitArrow : null;
  }

  Widget _initTitle(){
    // navigator title
    return Text(
      widget.titleText ?? "unnamed title",
      style: const TextStyle (
          fontFamily: AppFonts.primary,
          color: Colors.blueAccent
        ),
      );
  }
}