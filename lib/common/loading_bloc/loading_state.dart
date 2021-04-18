abstract class LoadingState {
  final bool loading;

  LoadingState({this.loading});
}

class Loading extends LoadingState {
  Loading() : super(loading: true);
}

class Loaded extends LoadingState {
  Loaded() : super(loading: false);
}
