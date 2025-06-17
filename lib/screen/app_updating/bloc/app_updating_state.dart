part of 'app_updating_bloc.dart';


class AppUpdatingState {
  ResultState<VersionResponse> versionResponse;
  ResultState<dynamic> downloadResponse;
  ResultState<ReleaseNotesResponse> releaseNotes;

  AppUpdatingState({
    required this.versionResponse,
    required this.downloadResponse,
    required this.releaseNotes
  });

  AppUpdatingState.init({
    this.versionResponse = const ResultState.idle(),
    this.downloadResponse = const ResultState.idle(),
    this.releaseNotes = const ResultState.idle()
  });

  AppUpdatingState copyWith({
    ResultState<VersionResponse>? versionResponse,
    ResultState<dynamic>? downloadResponse,
    ResultState<ReleaseNotesResponse>? releaseNotes
  }){
    return AppUpdatingState(
        versionResponse : versionResponse ?? this.versionResponse,
        downloadResponse: downloadResponse ?? this.downloadResponse,
        releaseNotes: releaseNotes ?? this.releaseNotes
    );
  }
}