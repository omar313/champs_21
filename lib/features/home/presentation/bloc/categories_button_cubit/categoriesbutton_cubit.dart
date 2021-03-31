import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categoriesbutton_state.dart';

class CategoriesbuttonCubit extends Cubit<CategoriesButtonState> {
  CategoriesbuttonCubit() : super(CategoriesbuttonInitial());

  void categoriesSelected(int position){
    emit(CategoriesButtonNewSelectedPosition(position));

  }

  void initialCategory(){
    emit(CategoriesButtonNewSelectedPosition(0));
  }


}
