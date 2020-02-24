import 'package:attendance_management/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttendanceListPage extends StatelessWidget {
  static String path = '/attendances';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: SkyBlue,
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                iconTheme: Theme.of(context).iconTheme,
                backgroundColor: SkyBlue,
                expandedHeight: 20.0,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  background: Container(
                    color: SkyBlue,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: FractionallySizedBox(
                        widthFactor: .9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Text(
                              index.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              height: 2,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
