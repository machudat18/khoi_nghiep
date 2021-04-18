import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_event.dart';
import 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(Loaded());
  @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    switch (event.runtimeType) {
      case StartLoading:
        yield Loading();
        break;
      case FinishLoading:
        yield Loaded();
        break;
    }
  }
}
