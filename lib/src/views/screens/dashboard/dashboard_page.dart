import 'package:colab/core/theme/colors.dart';
import 'package:colab/core/utils/constants/imageConstant.dart';
import 'package:colab/core/utils/constants/text_constant.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/main.dart';
import 'package:colab/services/routing/route_path.dart';
import 'package:colab/src/views/screens/dashboard/my_tools.dart';
import 'package:colab/src/views/widgets/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  RxBool switchValue = false.obs;
  final toolShow = false.obs;
  final myToolsList = {
    Imageconstant.labourData: TextConstant.labourData,
    Imageconstant.progress: TextConstant.activities,
    Imageconstant.qualityChecklist: TextConstant.qualityChecklist,
    Imageconstant.deSnag: TextConstant.deSnag,
    Imageconstant.drawing: TextConstant.drawingMaster,
    Imageconstant.hindrance: TextConstant.hindrance,
    Imageconstant.threeSixty: TextConstant.threeSixtyImage,
    Imageconstant.tasks: TextConstant.labourData,
    Imageconstant.tasks: TextConstant.permits,
    Imageconstant.requestInfo: TextConstant.requestInfo,
    Imageconstant.eventSchedule: TextConstant.eventSchedule,
    Imageconstant.gateentry: TextConstant.gateentry,
    Imageconstant.storage: TextConstant.storage,
    Imageconstant.requestResource: TextConstant.requestResource,
  };
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.slowMiddle,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Switch(
              activeColor: AppColors.primaryYellow,
              value: switchValue.value,
              onChanged: (val) {
                switchValue.value = val;
              }),
        ),
        actions: [
          Icon(Icons.notifications),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, The Lake Admin",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Last Sync -  6 Jan 2023  ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.textGreyColor),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 22.sp,
                      backgroundColor: AppColors.primaryYellow,
                      child: Image.asset(Imageconstant.colabUser),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Text(
                      "My Tools",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textBlackColor),
                    ),
                    Spacer(),
                    CustomSmallButton(
                      ontap: () {
                        toolShow.toggle();
                        if (toolShow.value) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      },
                      titleText: toolShow.value ? "Show less" : "Show All",
                      borderRadius: 20,
                      horizontal: 0,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                    height: toolShow.value ? 128.h : 16.h,
                    width: MediaQuery.of(context).size.width,
                    child: SizeTransition(
                      sizeFactor: _animation,
                      axisAlignment: -1.0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 50),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: toolShow.value
                            ? myToolGrid(context)
                            : myToolListView(context),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightBackground),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.black,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 6.h,
                          child: Text(
                            "Milestones",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                      SizedBox(
                        height: 28.h,
                        child: ListView(
                          children: [
                            kMilestoneBoxes(context,
                                title: "sdfgnh",
                                planedDate: "16 May 2023",
                                actualDate: "27 Mar 2024",
                                days: "316",
                                percent: "67"),
                            kMilestoneBoxes(context,
                                title: "testing milestone work",
                                planedDate: "16 May 2023",
                                actualDate: "27 Mar 2024",
                                days: "316",
                                percent: "18"),
                            kMilestoneBoxes(context,
                                title: "Hello Milestone",
                                planedDate: "16 May 2023",
                                actualDate: "13 Aug 2024",
                                days: "455",
                                percent: "46"),
                            kMilestoneBoxes(context,
                                title: "Newwwww testing",
                                planedDate: "21 May 2023",
                                actualDate: "27 Mar 2024",
                                days: "311",
                                percent: "71"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 35.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 6.h,
                          child: Row(
                            children: [
                              Text(
                                "Critical Task(0)",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: AppColors.textBlackColor,
                                        fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.refresh),
                              Container(
                                height: 5.h,
                                decoration: BoxDecoration(
                                    color: AppColors.lightBackground,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Text("None"),
                                    PopupMenuButton(
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      itemBuilder: (context) => [
                                        repeatedPopup(title: "None"),
                                        repeatedPopup(title: "Name"),
                                        repeatedPopup(title: "Made By"),
                                        repeatedPopup(title: "Due Date"),
                                        repeatedPopup(title: "Last Update"),
                                        repeatedPopup(title: "Category"),
                                        repeatedPopup(title: "Priority"),
                                        repeatedPopup(title: "Assign To"),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 28.h,
                        child: Center(
                          child: Text("No Task Found"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Text(
                        "Top 5 Assignee of Observations",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
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
                                  "Execution",
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
                                  "Safety",
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
                                  "Paint",
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
                        height: 25.h,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <CartesianSeries>[
                            StackedBarSeries<ChartData, String>(
                              dataSource: getObservationsChart(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1,
                              color: AppColors.orange,
                              name: 'Workmanship',
                            ),
                            StackedBarSeries<ChartData, String>(
                              dataSource: getObservationsChart(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y2,
                              color: AppColors.primaryBlue,
                              name: 'Minor',
                            ),
                            StackedBarSeries<ChartData, String>(
                              dataSource: getObservationsChart(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y3,
                              color: AppColors.red,
                              name: 'Critical',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        children: [
                          statusTile(context, "Open", "1"),
                          statusTile(context, "Closed", "8"),
                          statusTile(context, "Rejected", "0"),
                          statusTile(context, "Critical", "3"),
                          statusTile(context, "Major", "2"),
                          statusTile(context, "Minor", "6"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Text(
                        "Top 5 Assignee of Snags",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
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
                                  "Execution",
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
                                  "Safety",
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
                        height: 25.h,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <CartesianSeries>[
                            StackedBarSeries<ChartData, String>(
                              dataSource: getSnagChart(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1,
                              color: AppColors.orange,
                              name: 'Workmanship',
                            ),
                            StackedBarSeries<ChartData, String>(
                              dataSource: getSnagChart(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y2,
                              color: AppColors.primaryBlue,
                              name: 'Minor',
                            ),
                            StackedBarSeries<ChartData, String>(
                              dataSource: getSnagChart(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y3,
                              color: AppColors.red,
                              name: 'Critical',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        children: [
                          statusTile(context, "New", "25"),
                          statusTile(context, "Open", "3"),
                          statusTile(context, "Closed", "4"),
                          statusTile(context, "Critical", "11"),
                          statusTile(context, "Major", "13"),
                          statusTile(context, "Minor", "8"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Text(
                        "Top 5 Assignee of Snags",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Column(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: 10,
                              percent: 1,
                              progressColor: AppColors.primaryYellow,
                              backgroundColor: Colors.grey.shade300,
                              barRadius: const Radius.circular(5),
                            ),
                            Text(
                              "Safety",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 25.h,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <CartesianSeries>[
                            StackedBarSeries<ChartData, String>(
                              dataSource: getNCRChart(),
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y2,
                              color: AppColors.primaryBlue,
                              name: 'Minor',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        children: [
                          statusTile(context, "New", "3"),
                          statusTile(context, "Open", "0"),
                          statusTile(context, "Closed", "8"),
                          statusTile(context, "Critical", "0"),
                          statusTile(context, "Major", "0"),
                          statusTile(context, "Minor", "3"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Text(
                        "Inspection Summary",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.h),
                      Expanded(
                        child: GridView(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 10.h,
                            crossAxisCount: 3,
                          ),
                          children: [
                            kInspectionSummary(
                              context: context,
                              title: "New Check Lists",
                              count: "1",
                            ),
                            kInspectionSummary(
                                context: context,
                                title: "Open Check Lists",
                                count: "8",
                                color: AppColors.red),
                            kInspectionSummary(
                              context: context,
                              title: "Close Check Lists",
                              count: "7",
                            ),
                            kInspectionSummary(
                              context: context,
                              title: "Total Force Close",
                              count: "0",
                            ),
                            kInspectionSummary(
                              context: context,
                              title: "Reject Count",
                              count: "0",
                            ),
                            kInspectionSummary(
                              context: context,
                              title: "Average TAT",
                              count: "0",
                            ),
                            kInspectionSummary(
                              context: context,
                              title: "Total Triggerd",
                              count: "16",
                            ),
                            kInspectionSummary(
                                context: context,
                                title: "Total Debit Mode",
                                count: "0",
                                color: AppColors.green),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget kMilestoneBoxes(BuildContext context,
      {required String title,
      required String planedDate,
      required String actualDate,
      required String days,
      required String percent}) {
    return Container(
      padding: EdgeInsets.only(left: 1.w),
      margin: EdgeInsets.only(top: 0.5.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      height: 8.h,
      child: Row(
        children: [
          SizedBox(
            width: 55.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Planded :',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 9,
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '$planedDate |',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 9, color: AppColors.textBlackColor),
                      ),
                      TextSpan(
                        text: 'Actual :',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 9,
                            color: AppColors.textBlackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: actualDate,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 9, color: AppColors.textBlackColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 16.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$days days",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.red, fontSize: 16),
                ),
                Container(
                  height: 2.h,
                  width: 14.w,
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Delayed",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 9,
                          color: AppColors.textWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$percent%",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Progress",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14, color: AppColors.textBlackColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget statusTile(context, String title, String count) {
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

  Widget kInspectionSummary(
      {context,
      required String title,
      required String count,
      Color color = AppColors.textBlackColor}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            count,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: color, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.textBlackColor, fontSize: 10),
          ),
        ],
      ),
    );
  }

  List<ChartData> getSnagChart() {
    return [
      ChartData("lake Site Engg", 2.0, 1.2, 2.7),
      ChartData("Lakesiteengg3", 0.1, 0.1, 0),
      ChartData("Dummy", 0.1, 0.0, 0.0),
    ];
  }

  List<ChartData> getObservationsChart() {
    return [
      ChartData("lake Site Engg", 0.4, 2.0, 0.4),
      ChartData("test", 0.0, 0.2, 0.0),
      ChartData("Dummy", 0.0, 0.2, 0.0),
      ChartData("Abhay S.", 0.2, 0.0, 0.0),
    ];
  }

  List<ChartData> getNCRChart() {
    return [
      ChartData("lake Site Engg", 0.0, 3.2, 0.0),
    ];
  }

  Widget myToolListView(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        toolsGrid(
          context,
          img: Imageconstant.labourData,
          title: TextConstant.labourData,
        ),
        toolsGrid(
          context,
          img: Imageconstant.progress,
          title: TextConstant.activities,
        ),
        toolsGrid(
          context,
          img: Imageconstant.qualityChecklist,
          title: TextConstant.qualityChecklist,
        ),
        toolsGrid(
          context,
          img: Imageconstant.snag,
          title: TextConstant.snag,
        ),
        toolsGrid(
          context,
          img: Imageconstant.deSnag,
          title: TextConstant.deSnag,
        ),
        toolsGrid(
          context,
          img: Imageconstant.areaConcern,
          title: TextConstant.areaConcern,
        ),
        toolsGrid(
          context,
          img: Imageconstant.drawing,
          title: TextConstant.drawingMaster,
        ),
        toolsGrid(
          context,
          img: Imageconstant.hindrance,
          title: TextConstant.hindrance,
        ),
        toolsGrid(
          context,
          img: Imageconstant.threeSixty,
          title: TextConstant.threeSixtyImage,
        ),
        toolsGrid(context,
            img: Imageconstant.tasks, title: TextConstant.permits, ontap: () {
          context.push(RoutePath.permitTab);
        }),
        toolsGrid(
          context,
          img: Imageconstant.requestInfo,
          title: TextConstant.requestInfo,
        ),
        toolsGrid(
          context,
          img: Imageconstant.eventSchedule,
          title: TextConstant.eventSchedule,
        ),
        toolsGrid(
          context,
          img: Imageconstant.gateentry,
          title: TextConstant.gateentry,
        ),
        toolsGrid(
          context,
          img: Imageconstant.storage,
          title: TextConstant.storage,
        ),
        toolsGrid(
          context,
          img: Imageconstant.requestResource,
          title: TextConstant.requestResource,
        ),
      ],
    );
  }

  Widget myToolGrid(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.4,
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 16.h,
          crossAxisCount: 2,
        ),
        children: [
          toolsGrid(
            context,
            img: Imageconstant.labourData,
            title: TextConstant.labourData,
          ),
          toolsGrid(
            context,
            img: Imageconstant.progress,
            title: TextConstant.activities,
          ),
          toolsGrid(
            context,
            img: Imageconstant.qualityChecklist,
            title: TextConstant.qualityChecklist,
          ),
          toolsGrid(
            context,
            img: Imageconstant.snag,
            title: TextConstant.snag,
          ),
          toolsGrid(
            context,
            img: Imageconstant.deSnag,
            title: TextConstant.deSnag,
          ),
          toolsGrid(
            context,
            img: Imageconstant.areaConcern,
            title: TextConstant.areaConcern,
          ),
          toolsGrid(
            context,
            img: Imageconstant.drawing,
            title: TextConstant.drawingMaster,
          ),
          toolsGrid(
            context,
            img: Imageconstant.hindrance,
            title: TextConstant.hindrance,
          ),
          toolsGrid(
            context,
            img: Imageconstant.threeSixty,
            title: TextConstant.threeSixtyImage,
          ),
          toolsGrid(context,
              img: Imageconstant.tasks, title: TextConstant.permits, ontap: () {
            context.push(RoutePath.permitTab);
          }),
          toolsGrid(
            context,
            img: Imageconstant.requestInfo,
            title: TextConstant.requestInfo,
          ),
          toolsGrid(
            context,
            img: Imageconstant.eventSchedule,
            title: TextConstant.eventSchedule,
          ),
          toolsGrid(
            context,
            img: Imageconstant.gateentry,
            title: TextConstant.gateentry,
          ),
          toolsGrid(
            context,
            img: Imageconstant.storage,
            title: TextConstant.storage,
          ),
          toolsGrid(
            context,
            img: Imageconstant.requestResource,
            title: TextConstant.requestResource,
          ),
        ],
      ),
    );
  }

  Widget toolsGrid(BuildContext context,
      {required String img, required String title, Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 43.w,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 5.h,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.textBlackColor),
            ),
          ],
        ),
      ),
    );
  }
}

enum ScreenSize {
  mobile,
  tablet,
  laptop,
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3);

  final String x;
  final double y1;
  final double y2;
  final double y3;
}
