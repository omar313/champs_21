import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LimitedBox(
          child: Text("© চ্যাম্পস টোয়েন্টিওয়ান ডটকম ২০১০-২০১৮",
              style: TextStyle(
                color: Color(0xff364150),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
      ],
    );
  }
}
