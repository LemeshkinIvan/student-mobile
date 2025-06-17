import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/api/news_api.dart';
import 'package:student_cabinet_app/data/dto/response/news/news_response.dart';
import 'package:student_cabinet_app/domain/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsApi _api;

  NewsRepositoryImpl(this._api);

  @override
  Future<ApiResult<NewsResponse>> getAllNews() async {
    return await _api.getAllNews();
  }

  @override
  Future<ApiResult<NewsResponse>> getByGroup(String groupId) async {
    return await _api.getNewsByGroup(groupId);
  }
}