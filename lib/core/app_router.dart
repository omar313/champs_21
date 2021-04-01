import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/presentation/bloc/categories_button_cubit/categoriesbutton_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:champs_21/features/home/presentation/bloc/indicator/indicator_cubit.dart';
import 'package:champs_21/features/home/presentation/screens/home_page.dart';
import 'package:champs_21/features/home/presentation/screens/news_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (BuildContext context) =>
                          di.get<HomeBloc>()..add(HomeEventInitial()),
                    ),
                    BlocProvider(
                        create: (BuildContext context) =>
                            di.get<IndicatorCubit>()),
                    BlocProvider(
                        create: (BuildContext context) =>
                            di.get<CategoriesbuttonCubit>()..initialCategory()),
                    BlocProvider(
                        create: (BuildContext context) =>
                            di.get<CategoryListCubit>()..requestPostsByCategory(0)),
                  ],
                  child: HomePage(),
                ));

      case '/detail':
        final List<dynamic> args = settings.arguments;
        final CategoryModel model = args[0];
        final post = args[1];

        return MaterialPageRoute(
            builder: (context) => NewsDetailPage(
                  categoryModel: model,
                  post: post,
                ));

      default:
        return null;
    }
  }
}
