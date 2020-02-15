import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttendanceListPage extends StatelessWidget {
  static String path = '/attendances';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Placeholder();
        },
      ),
    );
  }
}
