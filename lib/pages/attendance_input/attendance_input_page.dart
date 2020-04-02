import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttendanceInputPage extends StatelessWidget {
  static String routeName = '/attendances/add';

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

class BottomInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pop(context);
            },
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          _createBottomTextField(context),
        ],
      ),
    );
  }

  Widget _createBottomTextField(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
          ),
          child: ColoredBox(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Attendance',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                MultipleLineTextField(),
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
    return FractionallySizedBox(
      widthFactor: .9,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Check In',
          ),
        ),
      ),
    );
  }
}

class MultipleLineTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      child: SizedBox(
        height: 300,
        child: Scrollbar(
          child: TextFormField(
            autofocus: true,
            maxLines: 6,
            minLines: 1,
          ),
        ),
      ),
    );
  }
}
