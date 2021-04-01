import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/presentation/bloc/categories_button_cubit/categoriesbutton_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/category_list_cubit/category_list_cubit.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      color: Colors.white,
      height: 75,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position) {
              return BlocBuilder<CategoriesbuttonCubit, CategoriesButtonState>(
                builder: (context, state) {
                  if (state is CategoriesButtonNewSelectedPosition) {
                    return GestureDetector(
                      onTap: (){
                        // context.read<HomeBloc>().add(HomeEventTapCategory(categories[position]));
                        context.read<CategoriesbuttonCubit>().categoriesSelected(position);
                        context.read<CategoryListCubit>().requestPostsByCategory(position);
                      },
                      child: ItemCategory(
                          isSelected: state.position == position,
                          name: categories[position].name,
                          imagePath: categories[position].imagePath),
                    );
                  } else {
                    return Container();
                  }
                },
              );
            }),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key key,
    @required this.isSelected,
    @required this.name,
    @required this.imagePath,
  }) : super(key: key);

  final bool isSelected;
  final String name, imagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width / 3.5,
           
            height: 45,
            decoration: BoxDecoration(
              color: isSelected ? kHiglightedColor : Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                isSelected
                    ? BoxShadow(
                        color: kHiglightedColor.withOpacity(0.3),
                        offset: Offset(0, 8),
                        blurRadius: 14,
                        spreadRadius: 0)
                    : BoxShadow(
                        color: Color(0x4d000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 0)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    imagePath,
                    width: 26,
                    height: 18.74,
                    color: isSelected ? Colors.white : null,
                  ),
                  SizedBox(
                    width: 9.4,
                  ),
                  Flexible(
                    child: Text(name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isSelected ? Color(0xffffffff) : kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
