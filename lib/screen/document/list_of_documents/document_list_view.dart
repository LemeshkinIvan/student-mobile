import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/models/fields_generator.dart';
import 'package:student_cabinet_app/common/models/operation_table_model.dart';
import 'package:student_cabinet_app/common/widgets/custom_card.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/regular_text.dart';
import 'package:student_cabinet_app/data/dto/response/document/document_response.dart';

class DocumentListView extends StatefulWidget {
  final List<DocumentResponse> documents;
  const DocumentListView({super.key, required this.documents});

  @override
  State<DocumentListView> createState() => _DocumentListViewState();
}

class _DocumentListViewState extends State<DocumentListView> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildListView(widget.documents);
  }

  Widget buildListView(List<DocumentResponse> data) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: returnListViewBuilder(data),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: data.length
    );
  }

  Widget Function(BuildContext p1, int p2) returnListViewBuilder(List<DocumentResponse> subj) {
    return (BuildContext context, int index) {
      var fields = FieldsGenerator.genMapDocumentList(data: subj[index]);
      return buildListViewItemWidget(subj[index], fields);
    };
  }

  Widget buildListViewItemWidget(
      DocumentResponse item, Map<ModelOfTableHeaders, String> fields) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        child: CustomCard(
          child: ListTile(
            leading: const Icon(Icons.file_present_sharp, color: Colors.yellow,),
            tileColor: Colors.white,
            title: buildBody(fields: Map.fromEntries(fields.entries.take(2))),
        )
      )
    );
  }

  Widget buildBody({required  Map<ModelOfTableHeaders, String> fields}) {
    return Column(
        children: fields.entries.map((entry) =>
            buildTextRow(entry.key.columnName, entry.value, false)
        ).toList()
    );
  }

  Widget buildTextRow(String key, String value, bool isTitle){
    return Row(
      children: [
        Expanded(
          child: RegularText(
            text: key,
            size: 12.sp, bold: true,
            wrap: true,
            color: Colors.black,
          )
        ),
        DefaultPadding(
          child: RegularText(
            color: Colors.lightBlue,
            text: value, size: 12.sp, wrap: true,
          )
        )
      ],
    );
  }

  @override
  void dispose(){
    super.dispose();
  }
}
