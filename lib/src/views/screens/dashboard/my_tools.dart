import 'package:colab/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyTools extends StatelessWidget {
  const MyTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top 5 Assignee of Snags",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 10,
                      percent: 0.7,
                      progressColor: Colors.orange,
                      backgroundColor: Colors.grey.shade300,
                      barRadius: const Radius.circular(5),
                    ),
                    Text(
                      "Workmenship",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 10,
                      percent: 0.5,
                      progressColor: Colors.blue,
                      backgroundColor: Colors.grey.shade300,
                      barRadius: const Radius.circular(5),
                    ),
                    Text(
                      "Workmanship",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 10,
                      percent: 0.3,
                      progressColor: AppColors.primaryBlack,
                      backgroundColor: Colors.grey.shade300,
                      barRadius: const Radius.circular(5),
                    ),
                    Text(
                      "Quality",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 30.h,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
                StackedBarSeries<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y1,
                  color: Colors.orange,
                  name: 'Workmanship',
                ),
                StackedBarSeries<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y2,
                  color: Colors.blue,
                  name: 'Minor',
                ),
                StackedBarSeries<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y3,
                  color: Colors.red,
                  name: 'Critical',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            children: [
              _statusTile(context, "Open", "8"),
              _statusTile(context, "Closed", "8"),
              _statusTile(context, "Rejected", "0"),
              _statusTile(context, "Critical", "3"),
              _statusTile(context, "Major", "2"),
              _statusTile(context, "Minor", "6"),
            ],
          )
        ],
      ),
    );
  }

  Widget _statusTile(context, String title, String count) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primaryBlack,
      ),
      child: Text(
        title + " : " + count,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.white, fontSize: 12),
      ),
    );
  }

  List<ChartData> _getChartData() {
    return [
      ChartData("Karan", 2.0, 3.3, 0),
      ChartData("Amit", 0.7, 0, 0),
      ChartData("Nilesh", 0.0, 4.0, 5.0),
      ChartData("Kuldeep", 1.6, 1.8, 0),
      ChartData("Vaibhav", 3.0, 2.0, 2.7),
    ];
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3);

  final String x;
  final double y1;
  final double y2;
  final double y3;
}
