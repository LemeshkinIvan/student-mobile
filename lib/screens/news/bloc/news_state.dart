part of 'news_bloc.dart';


class NewsState {
  ResultState<List<NewsResponse>> news;
  String selectedFilter;
 
  NewsState({
    required this.news,
    required this.selectedFilter
  });

  NewsState.init({
    this.news = const ResultState.idle(),
    this.selectedFilter = ""
  });

  NewsState copyWith({
    ResultState<List<NewsResponse>>? news,
    String? selectedFilter
  }){
    return NewsState(
        news : news ?? this.news,
        selectedFilter: selectedFilter ?? this.selectedFilter
    );
  }
}