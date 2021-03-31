import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/core/utility_methods.dart';
import 'package:flutter/material.dart';
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
      child: SizedBox(
        height: 90,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Hero(
                tag: imageUrl,
                child: Image.network(
                  imageUrl,
                  height: 78,
                  width: 78,
                  fit: BoxFit.cover,
                ),
              ),
              //   CachedNetworkImage(imageUrl: imageUrl,
              //   height: 78,
              //   width: 78,
              //   fit: BoxFit.cover,
              //   placeholder: (context,url) => Center(child: CircularProgressIndicator()),
              //   errorWidget: (_,__,___)=>Icon(Icons.error),)
              //
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    // HtmlText(shortDescription)
                    Text(removeAllHtmlTags(shortDescription),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
            ),
            SvgPicture.asset('assets/images/share.svg')
          ],
        ),
      ),
    );
  }
}
