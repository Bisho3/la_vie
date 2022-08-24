import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cubits/cubit.dart';

class BotNavBar extends StatelessWidget {
  const BotNavBar({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final LavieCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      buttonBackgroundColor: Colors.green,
      backgroundColor: Colors.white,
      color: Colors.white10,
      onTap: (index) {
        cubit.changeBottomNav(index);
      },
      index: cubit.currentIndex,
      items: const [
        Icon(
          FontAwesomeIcons.leaf,
          size: 30,
        ),
        Icon(
          FontAwesomeIcons.qrcode,
          size: 30,
        ),
        Icon(
          Icons.home_outlined,
          size: 30,
        ),
        Icon(
          Icons.notifications_outlined,
          size: 30,
        ),
        Icon(
          Icons.person,
          size: 30,
        ),
      ],
    );
  }
}
