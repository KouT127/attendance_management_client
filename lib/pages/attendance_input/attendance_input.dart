import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttendanceInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      heightFactor: .8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Text('Clock In'),
              Text('2020/02/15'),
              Text('Clock Out'),
              Text('2020/02/15'),
              Center(
                child: FractionallySizedBox(
                  widthFactor: .8,
                  child: TextField(
                    autofocus: true,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Clock in'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
