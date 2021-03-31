import 'package:champs_21/constants/colors.dart';
import 'package:flutter/material.dart';

class DetailHeadLine extends StatelessWidget {
  final String headLine;
  const DetailHeadLine({
    Key key,
    @required this.headLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Text(headLine,
              style: TextStyle(
                color: kTextColor,
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
      ],
    );
  }
}