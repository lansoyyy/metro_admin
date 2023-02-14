import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:metro_admin/widgets/text_widget.dart';

import '../../../utils/colors.dart';
import '../../../widgets/card_widget.dart';

class BookingsTabView extends StatelessWidget {
  final String type;

  const BookingsTabView({required this.type});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 500,
                      child: ListView.builder(itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Card(
                            child: Container(
                              color: iconColor,
                              width: 180,
                              height: 60,
                              child: ListTile(
                                trailing: SizedBox(
                                  width: 90,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextBold(
                                          text: 'Abra',
                                          fontSize: 14,
                                          color: Colors.black),
                                    ],
                                  ),
                                ),
                                title: SizedBox(
                                  width: 200,
                                  child: TextBold(
                                      text: 'Lebron James',
                                      fontSize: 18,
                                      color: blueAccent),
                                ),
                                subtitle: TextRegular(
                                    text: 'February 14, 2023 | 01:43PM',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      })),
                    )
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: MonthView(
                      controller: EventController(),
                      // to provide custom UI for month cells.
                      cellBuilder: (date, events, isToday, isInMonth) {
                        print(date.day);
                        // Return your widget to display as month cell.
                        return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: isToday ? Colors.blue : null,
                            ),
                            child: Center(
                                child: TextBold(
                                    text: date.day.toString(),
                                    fontSize: 18,
                                    color: Colors.black)));
                      },

                      minMonth: DateTime(1990),
                      maxMonth: DateTime(2050),

                      initialMonth: DateTime(2023),

                      cellAspectRatio: 1,
                      onPageChange: (date, pageIndex) =>
                          print("$date, $pageIndex"),
                      onCellTap: (events, date) {
                        print(date.day);
                        // Implement callback when user taps on a cell.
                      },
                      startDay: WeekDays
                          .sunday, // To change the first day of the week.
                      // This callback will only work if cellBuilder is null.
                      onEventTap: (event, date) => print(event),
                      onDateLongPress: (date) => print(date),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
