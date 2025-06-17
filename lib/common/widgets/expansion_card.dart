import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/models/operation_table_model.dart';
import 'package:student_cabinet_app/common/widgets/custom_card.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/regular_text.dart';

class OrdersCardPhone extends StatefulWidget {
  final  Map<ModelOfTableHeaders, String> header;
  final  Map<ModelOfTableHeaders, String> body;
  final Function()? onTap;
  final bool enableTrailing;
  final Function(String value)? colorTheTextBackground;
  final Widget? trailing;

  const OrdersCardPhone({
    super.key,
    required this.header,
    required this.body,
    this.onTap,
    required this.enableTrailing,
    this.colorTheTextBackground,
    this.trailing
  });

  @override
  State<OrdersCardPhone> createState() => _OrdersCardPhoneState();
}

class _OrdersCardPhoneState extends State<OrdersCardPhone> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          if (widget.onTap != null){
            widget.onTap!();
          }
        },
        child: CustomCard(
          radius: 12.r, shadow: true,
          borderColor: Colors.lightBlue,
          child: ExpansionTile(
              onExpansionChanged: (bool value) => setState(() => isExpanded = value),
              childrenPadding: EdgeInsets.symmetric(
                  horizontal: widget.trailing != null ? 0.w : 0.w),
              tilePadding: EdgeInsets.zero,
              title: buildTitleHeader(widget.header.values.first),
              subtitle: buildTitle(fields: widget.header),
              trailing: widget.enableTrailing ? returnTrailings() : null,
              children: [buildBody(fields: widget.body) ]
          ),
        )
    );
  }

  Widget returnTrailings(){
    return Column(
      children: [
        if (widget.trailing != null)
          Expanded(child: widget.trailing!),

        AnimatedRotation(
            turns: isExpanded ? 0.5 : 0.0,
            duration: const Duration(milliseconds: 120),
            child: Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: const Icon(
                Icons.expand_more,
                color: Colors.purple,
                size: 25,
              ),
            )
        )
      ],
    );
  }

  Widget buildTrailingIcon(){
    return GestureDetector(
      // мб проверка на нуль нужна
      onTap: () => widget.onTap!() ?? (){},
      child: Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget buildTitle({required  Map<ModelOfTableHeaders, String> fields}){
    var skipHeader = Map.fromEntries(fields.entries.skip(1));
    var widgets = skipHeader.entries.map((entry) =>
        buildHeaderRow(
            entry.key.columnName,
            entry.value,
            true
        )
    ).toList();

    return Column(
        children: widgets
    );
  }

  Widget buildTextRow(String key, String value, bool isTitle){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultPadding(
            child: Row(
              children: [
                Expanded(
                    child: RegularText(
                      text: key,
                      size: 12.sp, bold: true,
                      wrap: true,
                      color: Colors.black,
                    )
                )
              ],
            )
        ),
        DefaultPadding(
            child: RegularText(
              color: Colors.lightBlue,
              text: value, size: 12.sp, wrap: true,
            )
        ),
      ],
    );
  }

  Widget buildHeaderRow(String key, String value, bool isTitle){
    return Row(
      children: [
        DefaultPadding(
            child: RegularText(
              text: "$key: $value",
              size: 12.sp,
              wrap: true,
              color: Colors.black,
            )
        ),
      ],
    );
  }

  Widget buildTitleHeader(String value){
    return DefaultPadding(
        child: RegularText(
          text: value, bold: true, size: 14.sp, wrap: true, maxLines: 10,
        )
    );
  }

  Widget buildBody({required  Map<ModelOfTableHeaders, String> fields}){
    return Column(
        children: fields.entries.map((entry) =>
            buildTextRow(entry.key.columnName, entry.value, false)
        ).toList()
    );
  }
}
