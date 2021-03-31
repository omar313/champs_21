import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDrawer extends StatelessWidget {
  final String imagePath, name;
  final Function action;
  final double fontSize;
  const ItemDrawer({
    Key key,
    @required this.imagePath,
    @required this.name,
    @required this.action,
    this.fontSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: action,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 41,
      leading: Container(
        width: 40.7171630859375,
          height: 32.4508056640625,
        child: SvgPicture.asset(
          imagePath,
          
        ),
      ),
      title: Text(name,
            style: TextStyle(
      color: Color(0xff364150),
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
            )),
    );
  }
}
