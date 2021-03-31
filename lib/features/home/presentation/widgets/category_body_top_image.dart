import 'package:flutter/material.dart';

class CategoryBodyTopImage extends StatelessWidget {
  

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
          decoration:
              BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
            ),
            child: Text(
                "অ্যাপ স্টোরের সকল অ্যাপস পরীক্ষামূলক ব্যবহারের সুযোগ",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.34,
                )),
          ),
        ),
        background: Image.asset(
          'assets/images/cover_pic.png',
          height: size.height * 0.27,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
