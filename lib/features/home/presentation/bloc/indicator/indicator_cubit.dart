import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'indicator_state.dart';

class IndicatorCubit extends Cubit<IndicatorState> {
  IndicatorCubit() : super(IndicatorInitial());

  int oldPosition = -1;

  void changePostion(int position) {
    if (oldPosition < 0) {
      oldPosition = position;
      emit(IndicatorStateChangePosition(-1, position));
    } else{
       emit(IndicatorStateChangePosition(oldPosition, position));
       oldPosition = position;

    }
     
  }
}
