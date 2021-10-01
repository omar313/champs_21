import 'package:champs_21/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChampsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isShowDrawer;
  const ChampsAppBar({
    Key key, this.isShowDrawer = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: SvgPicture.asset('assets/images/logo.svg', width: 116.24,),
      leading: isShowDrawer ? Material(
        shape: CircleBorder(),
        color: Colors.transparent,
        child: Ink.image(
            child: InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
            ),
            image: AssetImage(
          'assets/images/menu.png',
        )),
      ) : IconButton(icon: Icon(Icons.arrow_back, color: kHiglightedColor,),onPressed: (){
         Navigator.pop(context);
      },),
      actions: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.search),
          onPressed: () {},
          color: kHiglightedColor,
        )
      ],
    );
  }

  @override

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
