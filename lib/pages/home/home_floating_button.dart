import 'package:attendance_management/pages/attendance_input/attendance_input.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AttendanceInputPage();
                },
              );
            },
            icon: Icon(
              Icons.add,
              color: SkyBlue,
            ),
            label: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'ClockIn',
                style: GoogleFonts.roboto(
                  color: SkyBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
    ;
  }
}
