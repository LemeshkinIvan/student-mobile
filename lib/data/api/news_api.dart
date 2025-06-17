import 'package:student_cabinet_app/data/api/api_error_handler.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/common/utils/http_util.dart';
import 'package:student_cabinet_app/data/dto/response/news/news_response.dart';

class NewsApi extends ApiErrorHandler {
  final HttpUtil httpUtil;
  final HttpAuthUtil httpAuthUtil;

  NewsApi({
    required this.httpUtil,
    required this.httpAuthUtil,
  });

  Future<ApiResult<NewsResponse>> getAllNews() async {
    try {
      final response = await HttpUtil().get("news/all");
      NewsResponse data = NewsResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<NewsResponse>> getNewsByGroup(String groupId) async {
    try {
      final response = await HttpUtil().get("news/byGroup/$groupId");
      NewsResponse data = NewsResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }
}