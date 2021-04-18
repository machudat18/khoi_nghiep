abstract class LoadingEvent {}

class StartLoading extends LoadingEvent {
  StartLoading();
}

class FinishLoading extends LoadingEvent {}
