import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screentab_state.dart';

class ScreentabCubit extends Cubit<ScreentabState> {
  ScreentabCubit() : super(ScreentabState(bottomAppBarItemIndex: 0));

  void changeView(int index) =>
      emit(ScreentabState(bottomAppBarItemIndex: index));
}
