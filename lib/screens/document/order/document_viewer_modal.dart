import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:student_cabinet_app/common/values/colors.dart';

import '../../../common/widgets/modal.dart';

class DocumentViewerModal extends StatelessWidget {
  const DocumentViewerModal({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDefaultModal(context, const SfPdfViewerTheme(
        data: SfPdfViewerThemeData (
            progressBarColor: AppColors.green1,
            backgroundColor: AppColors.white
        ),
        child: Center()
      )
    );
  }
}
