import 'package:flutter/material.dart';
import 'package:student_cabinet_app/main.dart';


class DocumentViewer extends StatefulWidget {
  const DocumentViewer({super.key});

  @override
  State<DocumentViewer> createState() => _DocumentViewerState();
}

class _DocumentViewerState extends State<DocumentViewer> {
  String path = "";

  @override
  void initState(){
    //path = context.read<DocumentCubit>().getFileUrl();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои документы"),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              navigatorKey.currentState?.pop();
            },
            icon: const Icon(Icons.arrow_back)
        ),
      ),
    body: const Center(child: SizedBox(),));
    //    SfPdfViewerTheme(
    //     data:  SfPdfViewerThemeData (
    // progressBarColor: AppColors.green1,
    // backgroundColor: AppColors.white
    // ),
    // child: SfPdfViewer.network (
    // "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
    // pageLayoutMode: PdfPageLayoutMode.continuous,
    // )
    // ));
  }
}
