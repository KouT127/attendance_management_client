import 'package:attendance_management/pages/attendance_list/attendance_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShadowlessAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShadowlessAppBar();

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
                  Navigator.of(context).pushNamed(AttendanceListPage.routeName);
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
