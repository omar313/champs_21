import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'footer.dart';
import 'item_drawer.dart';

class ChampsDrawer extends StatelessWidget {
  const ChampsDrawer({
    Key key,
    @required this.categories,
  }) : super(key: key);

 
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 41.0, right: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 36,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 41.0, right: 10),
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, position) {
                      return ItemDrawer(
                          imagePath: categories[position].imagePath,
                          name: categories[position].name,
                          action: () {
                            context.read<HomeBloc>().add(HomeEventTapDrawerCategory(categories[position]));
                            Navigator.of(context).pop();
                          });
                    }),
              ),
            ),
            Divider(
              color: Color(0x29000000),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 41.0, right: 10),
              child: Column(
                children: [
                  ItemDrawer(
                      imagePath: 'assets/images/meeting.svg',
                      name: 'আমাদের সম্পর্কে',
                      fontSize: 19,
                      action: () {}),
                  ItemDrawer(
                      imagePath: 'assets/images/condition.svg',
                      name: 'শর্তাবলী',
                      fontSize: 19,
                      action: () {}),
                ],
              ),
            ),
           
            Footer()
          ],
        ),
      ),
    );
  }
}


