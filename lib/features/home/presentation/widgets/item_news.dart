import 'package:cached_network_image/cached_network_image.dart';
import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/core/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class ItemNews extends StatelessWidget {
  const ItemNews({
    Key key,
    @required this.imageUrl,
    @required this.title,
    @required this.shortDescription,
  }) : super(key: key);

  final String title, shortDescription, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            caption: 'Archive',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () {},
          ),
          IconSlideAction(
            caption: 'Share',
            color: Colors.indigo,
            icon: Icons.share,
            onTap: () {},
          ),
        ],
        child: SizedBox(
          height: 90,
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child:
                      // Hero(
                      //   tag: imageUrl,
                      //   child:
                      //   Image.network(
                      //     imageUrl,
                      //     height: 78,
                      //     width: 78,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      Hero(
                    tag: imageUrl,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 78,
                      width: 78,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => Icon(Icons.error),
                    ),
                  )),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      // HtmlText(shortDescription)
                      Text(removeAllHtmlTags(shortDescription),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
              ),
              // SvgPicture.asset('assets/images/share.svg')
            ],
          ),
        ),
      ),
    );
  }
}
