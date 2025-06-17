import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/dto/response/news/news_response.dart';

abstract class NewsRepository {
  Future<ApiResult<NewsResponse>> getAllNews();

  Future<ApiResult<NewsResponse>> getByGroup(String groupName);
}