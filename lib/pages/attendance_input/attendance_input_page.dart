import 'package:attendance_management/pages/home/component/home_timer_section.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttendanceInputPage extends StatelessWidget {
  static String routeName = '/attendances/add';

  @override
  Widget build(BuildContext context) {
    return const _AttendanceInputPage();
  }
}

class _AttendanceInputPage extends StatelessWidget {
  const _AttendanceInputPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                const HomeTimer(),
                Row(
                  children: <Widget>[
                    Text(
                      'Reason',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                MultipleLineTextField(),
                Spacer(),
                _buildOutLinedButton(context),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutLinedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        color: SkyBlue,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Check In',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MultipleLineTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.withOpacity(.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Scrollbar(
          child: TextFormField(
            autofocus: true,
            maxLines: 8,
            minLines: 8,
          ),
        ),
      ),
    );
  }
}
