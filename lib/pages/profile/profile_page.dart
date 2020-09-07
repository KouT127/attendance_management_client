import 'package:attendance_management/pages/home/component/home_display_box.dart';
import 'package:attendance_management/pages/home/home_notifier.dart';
import 'package:attendance_management/states/home_state.dart';
import 'package:attendance_management/widgets/app_bar.dart';
import 'package:attendance_management/widgets/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class WorkedTime {
  const WorkedTime({
    this.workedTime,
    this.dayOfWeek,
  });

  final double workedTime;
  final String dayOfWeek;
}

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeNotifier, HomeState>(
      create: (_) => HomeNotifier(),
      child: const _ProfilePage(),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShadowlessAppBar(),
      body: ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: SafeArea(
          top: false,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: .9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        buildImageBox(context),
                        const SizedBox(height: 10),
                        Text(
                          'kou 127',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            HomeRadialChartBox(
                              title: 'Total ',
                              workedTime: context.select<HomeState, double>(
                                (state) => state.workedTime,
                              ),
                              totalTime: context.select<HomeState, double>(
                                (state) => state.totalTime,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        WeeklyChartBox(
                          title: 'Weekly',
                          workedTimes: [
                            WorkedTime(workedTime: 8),
                            WorkedTime(workedTime: 10.5),
                            WorkedTime(workedTime: 8.8),
                            WorkedTime(workedTime: 8),
                            WorkedTime(workedTime: 3),
                          ],
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageBox(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: 55,
        width: 55,
        child: ColoredBox(
          color: Theme.of(context).accentColor,
          child: Icon(
            Icons.account_circle,
            size: 55,
          ),
        ),
      ),
    );
  }
}

class WeeklyChartBox extends StatelessWidget {
  const WeeklyChartBox({
    @required this.title,
    @required this.workedTimes,
  });

  final String title;
  final List<WorkedTime> workedTimes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 15,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(0),
                      tooltipBottomMargin: 0,
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          rod.y.toString(),
                          const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: const TextStyle(
                        color: Color(0xff7589a2),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      margin: 8,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return '月';
                          case 1:
                            return '火';
                          case 2:
                            return '水';
                          case 3:
                            return '木';
                          case 4:
                            return '金';
                          case 5:
                            return '土';
                          case 6:
                            return '日';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: const SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: buildChartRods(this.workedTimes),
                ),
              ),
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> buildChartRods(List<WorkedTime> workedTimes) {
    final chartGroup = <BarChartGroupData>[];
    workedTimes.asMap().forEach((index, time) {
      chartGroup.add(BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(y: time.workedTime, color: SkyBlue),
        ],
        showingTooltipIndicators: [0],
      ));
    });
    return chartGroup;
  }
}
