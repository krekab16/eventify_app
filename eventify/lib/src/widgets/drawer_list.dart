import 'package:flutter/material.dart';
import '../utils/styles.dart';

class DrawerList extends StatelessWidget {
  final String name;
  final Widget icon;

  const DrawerList(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: Styles.eventTitleStyles,
      ),
      onTap: () {
        Navigator.pop(context);
      },
      leading: icon,
    );
  }
}
