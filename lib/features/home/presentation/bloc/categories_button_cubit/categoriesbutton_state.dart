part of 'categoriesbutton_cubit.dart';

abstract class CategoriesButtonState extends Equatable {
  const CategoriesButtonState();

  @override
  List<Object> get props => [];
}

class CategoriesbuttonInitial extends CategoriesButtonState {}
class CategoriesButtonNewSelectedPosition extends CategoriesButtonState{
  final int position;

  CategoriesButtonNewSelectedPosition(this.position);
   @override
  List<Object> get props => [this.position];

}