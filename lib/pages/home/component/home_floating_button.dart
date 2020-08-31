import 'package:attendance_management/pages/attendance_input/attendance_input_page.dart';
import 'package:attendance_management/services/app_navigator.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 150,
            minHeight: 50,
          ),
          child: FloatingActionButton.extended(
            onPressed: () => NavigatorHolder.rootState
                .pushNamed(AttendanceInputPage.routeName),
            icon: Icon(
              Icons.add,
              color: Theme.of(context)
                  .primaryIconTheme
                  .copyWith(color: Colors.white)
                  .color,
            ),
            label: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Check In',
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            backgroundColor: SkyBlue,
          ),
        ),
      ),
    );
  }
}
