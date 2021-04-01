import 'package:carousel_slider/carousel_slider.dart';
import 'package:champs_21/constants/app_data.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/domain/repository/home_repository.dart';
import 'package:champs_21/features/home/presentation/bloc/home_bloc.dart';
import 'package:champs_21/features/home/presentation/bloc/indicator/indicator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class PicSlider extends StatelessWidget {
  final List<Post> posts;

  const PicSlider({Key key, this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: CarouselSlider.builder(
          itemCount: posts.length,
          itemBuilder: (context, position, _) {
            return GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(HomeEventTapNews(
                    di.get<AppConstantData>().categories[0],
                    posts[position]));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      width: size.width * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a000000),
                              offset: Offset(0, 3),
                              blurRadius: 7,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Image.network(
                        posts[position].featureImage,
                        fit: BoxFit.cover,
                      ),
                      // child: Image.asset('assets/images/cover_pic.png',
                      // fit: BoxFit.cover,),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: size.height * 0.075,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13.0, vertical: 8),
                          child: Text(posts[position].title,
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.34,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, _) {
                context.read<IndicatorCubit>().changePostion(index);
              })),
    );
  }
}
