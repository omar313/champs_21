import 'package:cached_network_image/cached_network_image.dart';
import 'package:champs_21/constants/app_data.dart';
import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/core/widgets/html_text.dart';
import 'package:champs_21/features/home/domain/entity/category_model.dart';
import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:champs_21/features/home/presentation/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'category_body_header.dart';
import 'detail_headline.dart';
import 'news_meta_info.dart';

class NewsDetailBody extends StatelessWidget {
  final CategoryModel categoryModel;
  final Post post;

  const NewsDetailBody({Key key, this.categoryModel, this.post})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CategoryBodyHeader(
          imagePath: categoryModel.imagePath,
          name: categoryModel.name,
          isShowBack: false,
        ),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: Container(),
                actions: [
                  SvgPicture.asset(
                    'assets/images/share.svg',
                    color: Colors.white,
                  )
                ],
                stretch: true,
                expandedHeight: size.height * 0.27,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  background: Hero(
                      tag: post.featureImage,
                      child:
                          //  Image.network(
                          //   post.featureImage,
                          //   height: size.height * 0.27,
                          //   width: double.infinity,
                          //   fit: BoxFit.cover,
                          // ),
                          CachedNetworkImage(
                        imageUrl: post.featureImage,
                        height: size.height * 0.27,
                         errorWidget: (_, __, ___) => Icon(Icons.error),
                      )),
                ),
              ),
              // SliverFillRemaining(
              //     child: Padding(
              //   padding: const EdgeInsets.all(13.0),
              //   child: Column(
              //     children: [
              //       DetailHeadLine(
              //         headLine:
              //             "ক্লাসটিউন : একই প্লাটফর্মে স্কুলের যাবতীয় সমাধান ",
              //       ),
              //       NewsMetaInfo(authorName: 'বদরুদ্দোজা মাহমুদ তুহিন', date: 'জানুয়ারি ১৪, ২০১৮', totalViewText: '1853'),
              //       Text(kDemoText),

              //     ],
              //   ),
              // )),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DetailHeadLine(
                        headLine: post.title,
                      ),
                      NewsMetaInfo(
                          authorName: '${post.author}',
                          date: '${post.date}',
                          totalViewText: '1853'),
                      // Text(
                      //   kDemoText,
                      //   style: TextStyle(
                      //     color: kTextColor,
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w400,
                      //     fontStyle: FontStyle.normal,
                      //   ),
                      // ),
                      HtmlText(post.content),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Image.asset(
                          'assets/images/advertise.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              color: kHiglightedColor,
                              child: Text("একই ধরণের",
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ))),
                        ],
                      ),
                      // Divider(color: kHiglightedColor, thickness: 1,)
                      Container(
                          width: double.infinity,
                          color: kHiglightedColor,
                          height: 1),

                      SizedBox(
                        height: 25,
                      ),

                      Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, position) {
                              return ItemSimilarNews();
                            }),
                      ),
                      Footer()
                    ],
                  ),
                )
              ]))
            ],
          ),
        ),
      ],
    );
  }
}

class ItemSimilarNews extends StatelessWidget {
  const ItemSimilarNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.05),
      child: Container(
        width: size.width * 0.3,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset('assets/images/cover_pic.png',
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  fit: BoxFit.cover),
            ),
            SizedBox(
              height: 5,
            ),
            Text("বাচ্চা স্ট্রেসের শিকার হলে করণীয়",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ))
          ],
        ),
      ),
    );
  }
}
