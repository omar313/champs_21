import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/features/home/presentation/widgets/total_view.dart';
import 'package:flutter/material.dart';

class NewsMetaInfo extends StatelessWidget {
  final String authorName, date, totalViewText;
  const NewsMetaInfo({
    Key key, @required this.authorName, @required this.date, @required this.totalViewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("# $authorName",
                  style: TextStyle(
                    color: Color(0xff1cbff2),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(
                width: 5,
              ),
              Text("- $date",
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
          TotalView(
            totalView: totalViewText,
          )
        ],
      ),
    );
  }
}

