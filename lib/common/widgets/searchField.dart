import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:student_cabinet_app/common/values/colors.dart';

class CustomSearchField extends StatelessWidget{
  final String? hint;
  final List<SearchFieldListItem<String>>? suggestions;
  final SearchController? textController;
  final int? length;

  const CustomSearchField({
    super.key,
    required this.hint,
    required this.suggestions,
    required this.textController,
    required this.length
  });

  @override
  Widget build(BuildContext context){
    return SearchField(
      maxLength: length,
      controller: textController,
      textAlign: TextAlign.center,
      searchInputDecoration: SearchInputDecoration(
        counterText: "",
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: const Icon(Icons.search),
          hintStyle: const TextStyle(
            fontSize: 18, 
            color: AppColors.primary
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.orange,
              style: BorderStyle.solid,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
          )
        ),
      suggestions: suggestions ?? []
    );
  }
}