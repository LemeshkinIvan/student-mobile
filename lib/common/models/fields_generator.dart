
import 'package:student_cabinet_app/common/models/operation_table_model.dart';
import 'package:student_cabinet_app/data/dto/response/document/document_response.dart';
import 'package:student_cabinet_app/data/dto/response/schedule/schedule_response.dart';

class FieldsGenerator {

  static Map<ModelOfTableHeaders, String> genMapDaySchedule({required SubjectInnerObject data}) {
    return {
      const ModelOfTableHeaders("Название пары:", 2): data.name,
      const ModelOfTableHeaders("Преподаватель:", 1): data.nameTeacher,
      const ModelOfTableHeaders("Кабинет:", 1): data.cabinetNumber,
      const ModelOfTableHeaders("Время начала:", 2): data.time,
      const ModelOfTableHeaders("Номер пары:", 1): data.count
    };
  }

  static Map<ModelOfTableHeaders, String> genMapDocumentList({
    required DocumentResponse data}) {
    return {
      const ModelOfTableHeaders("Название:", 2): data.name,
      const ModelOfTableHeaders("Дата создания:", 1): data.createdAt,
    };
  }
}
