import 'package:champs_21/features/home/domain/entity/post_model.dart';
import 'package:flutter/material.dart';

class CategoryBodyTopImage extends StatelessWidget {
  final Post post;

  const CategoryBodyTopImage({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      leading: Container(),
      stretch: true,
      expandedHeight: size.height * 0.27,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Container(
          height: size.height * 0.075,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(post.title,
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.34,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        background: Image.network(
          post.featureImage,
          height: size.height * 0.27,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
