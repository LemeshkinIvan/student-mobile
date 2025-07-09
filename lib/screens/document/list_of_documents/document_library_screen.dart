import 'package:flutter/material.dart';

// List<FileDto> data = [
//   FileDto("Справка с места учебы", "uhf30h", "3fh3hf", "efhef", DateTime.now().toString()),
//   FileDto("Справка о стипендии", "uhf30h", "3fh3hf", "efhef", DateTime.now().toString()),
//   FileDto("Справка для военкомата", "uhf30h", "3fh3hf", "efhef", DateTime.now().toString())
// ];

class DocumentLibraryScreen extends StatefulWidget {
  const DocumentLibraryScreen({super.key});

  @override
  State<DocumentLibraryScreen> createState() => _DocumentLibraryScreenState();
}

class _DocumentLibraryScreenState extends State<DocumentLibraryScreen>{
  int selectedItem = -1;
  bool isTapped = false;
  // List<FileDto> items = [];

  @override
  void initState(){
    //context.read<DocumentCubit>().getFiles();
    super.initState();
  }

  // @override
  // Widget build(BuildContext context){
  //   return DefaultTabController(
  //     length: items.length,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Мои документы"),
  //         centerTitle: true,
  //         leading: IconButton(
  //           onPressed: (){
  //             navigatorKey.currentState?.pushNamed(AppRoutes.service);
  //           },
  //           icon: const Icon(Icons.arrow_back)
  //         ),
  //       ),
  //       body: Column(
  //         children: [
  //           Expanded(
  //               child: DocumentListView(documents: data)
  //           )
  //         ],
  //       )
  //     )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}