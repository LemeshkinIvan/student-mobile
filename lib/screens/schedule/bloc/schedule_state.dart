part of 'schedule_bloc.dart';

class ScheduleState {
  ResultState<ScheduleResponse> schedule;
  ResultState<Uint8List> annualSchedule;

  ScheduleState({
    required this.schedule,
    required this.annualSchedule
  });

  ScheduleState.init({
    this.annualSchedule = const ResultState.idle(),
    this.schedule = const ResultState.idle()
  });

  ScheduleState copyWith({
    ResultState<ScheduleResponse>? schedule,
    ResultState<Uint8List>? annualSchedule
  }){
    return ScheduleState(
        schedule : schedule ?? this.schedule,
        annualSchedule : annualSchedule ?? this.annualSchedule
    );
  }
}