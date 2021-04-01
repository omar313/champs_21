import 'package:champs_21/constants/app_data.dart';
import 'package:champs_21/core/widgets/champs_app_bar.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:champs_21/features/home/presentation/widgets/category_news_body.dart';
import 'package:champs_21/features/home/presentation/widgets/champs_drawer.dart';
import 'package:champs_21/features/home/presentation/widgets/home_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories =  di.get<AppConstantData>().categories;
    return Scaffold(
        appBar: ChampsAppBar(),
        drawer: ChampsDrawer(categories: categories),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeStateNewsDetailLoad) {
              Navigator.pushNamed(context, '/detail',
                  arguments: [state.categoryModel, state.post ]);
            }
          },
          builder: (context, state) {
            if (state is HomeStateInitial)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is HomeStatePostLoaded) {
             return HomeBody(
                categories: categories,
                posts: state.posts,
              );
            } else if (state is HomeStateCategoryFullPageLoad)
              return CategoryNewsBody(
                categoryModel: state.categoryModel,
              );
            else if (state is HomeStateError) {
              return Center(
                child: Text(state.error),
              );
            }else {
              return Container();
            }
          },
          buildWhen: (previous, current) {
            if (current is HomeStateNewsDetailLoad) return false;
            return true;
          },
        ));
  }
}
