import 'package:champs_21/features/home/data/repository/home_repository_impl.dart';
import 'package:champs_21/features/home/domain/repository/home_repository.dart';
import 'package:champs_21/features/home/domain/usecase/get_posts_by_category.dart';
import 'package:champs_21/features/home/domain/usecase/get_recent_post.dart';
import 'package:champs_21/features/home/presentation/bloc/categories_button_cubit/categoriesbutton_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:champs_21/features/home/presentation/bloc/indicator/indicator_cubit.dart';
import 'package:get_it/get_it.dart';

import 'constants/app_data.dart';
import 'core/network/api_utlis.dart';

final di = GetIt.instance;

Future<void> init() async {
//Bloc
  di.registerFactory(() => HomeBloc(di()));
  di.registerFactory(() => IndicatorCubit());
  di.registerFactory(() => CategoriesbuttonCubit());
  di.registerLazySingleton(() => CategoryListCubit());

  // repository
  di.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

// use case
  di.registerLazySingleton<GetRecentPost>(() => GetRecentPostImpl(di()));
  di.registerLazySingleton<GetPostsByCategory>(
      () => GetPostsByCategoryImpl(di()));

  // core
  di.registerLazySingleton(() => ApiUtil());
  di.registerLazySingleton(() => AppConstantData());
}
