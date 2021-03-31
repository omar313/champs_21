import 'package:flutter/material.dart';

class TotalView extends StatelessWidget {
  final String totalView;
  const TotalView({
    Key key,
    @required this.totalView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.43115234375,
      height: 51.43115234375,
      decoration: new BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.remove_red_eye_rounded,
            color: Color(0xffbcbcbc),
          ),
          Container(
              width: 45.810302734375,
              height: 1,
              decoration: new BoxDecoration(
                color: Color(0xffbcbcbc),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 0.5),
                      blurRadius: 2,
                      spreadRadius: 0)
                ],
              )),
          Text(totalView,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xffbcbcbc),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ))
        ],
      ),
    );
  }
}
