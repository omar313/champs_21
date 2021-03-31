part of 'indicator_cubit.dart';

abstract class IndicatorState extends Equatable {
  const IndicatorState();

  @override
  List<Object> get props => [];
}

class IndicatorInitial extends IndicatorState {}

class IndicatorStateChangePosition extends IndicatorState {
 final int oldPosition,newPosition;

  IndicatorStateChangePosition(this.oldPosition, this.newPosition);

  @override
  List<Object> get props => [this.oldPosition, this.newPosition];


}