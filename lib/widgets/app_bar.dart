import 'package:attendance_management/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShadowlessAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: SafeArea(
          child: Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingsPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 80);
}
