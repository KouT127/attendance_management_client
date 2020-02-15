import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class HomeTimerSection extends StatelessWidget {
  const HomeTimerSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ASIA/TOKYO",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              model.formattedDate,
              style: GoogleFonts.roboto(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              model.formattedTime,
              style: GoogleFonts.roboto(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
