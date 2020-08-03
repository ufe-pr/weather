

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 1,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/drawer icon.svg'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Drawer soon'),
              duration: Duration(seconds: 3),
            ),
          );
        },
      ),
      title: SvgPicture.asset('assets/icons/Text logo.svg'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}