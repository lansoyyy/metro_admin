import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/appbar_widget.dart';
import 'package:metro_admin/widgets/card_widget.dart';
import 'package:metro_admin/widgets/listtile_widget.dart';
import 'package:metro_admin/widgets/text_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: 180,
                  decoration: BoxDecoration(
                    color: secondaryRed,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: TextBold(
                        text: 'Good day, Admin!',
                        fontSize: 12,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardWidget(
                      widget: ListTile(
                        trailing: Icon(
                          Icons.keyboard_double_arrow_up,
                          color: greenAccent,
                        ),
                        title: TextBold(
                            text: 'Total Customers',
                            fontSize: 18,
                            color: blueAccent),
                        subtitle: TextBold(
                            text: '351', fontSize: 32, color: blueAccent),
                        leading: Container(
                          height: 100,
                          width: 60,
                          decoration: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.group_add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CardWidget(
                      widget: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextBold(
                                text: 'Total Sales',
                                fontSize: 18,
                                color: blueAccent),
                            const SizedBox(
                              height: 10,
                            ),
                            LinearPercentIndicator(
                              barRadius: const Radius.circular(100),
                              width: 140,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2000,
                              percent: 0.9,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                                text: '250K out of 300k quota',
                                fontSize: 12,
                                color: Colors.grey),
                          ],
                        ),
                        leading: Container(
                          height: 100,
                          width: 60,
                          decoration: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.stacked_line_chart_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CardWidget(
                      widget: ListTile(
                        title: TextBold(
                            text: 'No. of Bookings',
                            fontSize: 18,
                            color: blueAccent),
                        subtitle: TextBold(
                            text: '14', fontSize: 32, color: blueAccent),
                        leading: Container(
                          height: 100,
                          width: 60,
                          decoration: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.book,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                            text: 'Overall Statistics',
                            fontSize: 18,
                            color: blueAccent),
                        const SizedBox(
                          height: 20,
                        ),
                        ListTileWidget(
                            title: 'Number of Taxis on Duty',
                            subtitle: '50 out of 100',
                            icon: Icons.local_taxi,
                            color: greenAccent),
                        ListTileWidget(
                            title: 'Number of Rides',
                            subtitle: '50 out of 100',
                            icon: Icons.taxi_alert,
                            color: blueAccent),
                        ListTileWidget(
                            title: 'Number of Bookings Cancelled by Users',
                            subtitle: '50',
                            icon: Icons.cancel,
                            color: amberAccent),
                        ListTileWidget(
                            title: 'Number of Bookings Cancelled by Drivers',
                            subtitle: '1',
                            icon: Icons.cancel,
                            color: secondaryRed),
                        ListTileWidget(
                            title: 'Total Trips Cancelled',
                            subtitle: '6',
                            icon: Icons.cancel,
                            color: orangeAccent),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 400,
                            width: 500,
                            decoration: BoxDecoration(
                              color: tileColorDashboard,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
