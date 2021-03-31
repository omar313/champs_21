import 'package:flutter/material.dart';

class CategoryBodyBigImage extends StatelessWidget {
  const CategoryBodyBigImage({
    Key key,
   
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/images/cover_pic.png',
          height: size.height * 0.27,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: size.height * 0.075,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
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
        )
      ],
    );
  }
}