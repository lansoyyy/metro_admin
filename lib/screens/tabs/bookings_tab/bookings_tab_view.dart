import 'package:flutter/material.dart';
import 'package:metro_admin/widgets/text_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../utils/colors.dart';
import '../../../widgets/card_widget.dart';

class BookingsTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 3,
            child: Container(
              height: 40,
              width: 400,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: TextFormField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: TextStyle(fontFamily: 'QRegular'),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
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
                  CardWidget(
                    widget: ListTile(
                      trailing: Icon(
                        Icons.keyboard_double_arrow_up,
                        color: greenAccent,
                      ),
                      title: TextBold(
                          text: 'No. of Rides',
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
                            Icons.local_taxi_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextBold(
                      text: '  Overview', fontSize: 24, color: Colors.black),
                  const Divider(),
                  SizedBox(
                    width: 300,
                    height: 500,
                    child: ListView.builder(itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Container(
                            color: iconColor,
                            width: 75,
                            height: 50,
                          ),
                        ),
                      );
                    })),
                  )
                ],
              ),
              SfCalendar(),
            ],
          ),
        ],
      ),
    );
  }
}
