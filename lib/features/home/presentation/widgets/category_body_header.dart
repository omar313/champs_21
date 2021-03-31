import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBodyHeader extends StatelessWidget {
  const CategoryBodyHeader({
    Key key,
    @required this.imagePath,
    @required this.name, this.isShowBack = true,
  }) : super(key: key);

  final String imagePath, name;
  final bool isShowBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.5,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
              color: Color(0x4d000000),
              offset: Offset(0, 9),
              blurRadius: 6,
              spreadRadius: 0)
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
              imagePath,
                width: 26.58349609375,
                height: 18.743896484375,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.4),
                child: Text(name,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ],
          ),
         isShowBack? Positioned(
            left: 0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                context.read<HomeBloc>().add(HomeEventInitial());
              },
            ),
          ): Container(),
        ],
      ),
    );
  }
}
