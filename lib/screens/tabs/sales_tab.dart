import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/text_widget.dart';
import 'package:intl/intl.dart';

class SalesTab extends StatefulWidget {
  const SalesTab({super.key});

  @override
  State<SalesTab> createState() => _SalesTabState();
}

class _SalesTabState extends State<SalesTab> {
  int _index = 0;

  List<String> filters = ['Weekly', 'Monthly', 'Yearly'];

  String filter = '';
  String filterType = '';

  List<String> days = [
    'Monday',
    'Tuesday',
    ' Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  List<int> daysValue = [1, 2, 3, 4, 5, 6, 7];

  List<String> weeks = [
    'Week 1',
    'Week 2',
    'Week 3',
    'Week 4',
  ];

  List<int> weeksValue = [
    1,
    2,
    3,
    4,
  ];

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<int> monthsValue = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  var selectedType = 0;

  myFilter() {
    print('called');
    if (filter == 'Weekly') {
      return FirebaseFirestore.instance
          .collection('Bookings')
          .where('year', isEqualTo: DateTime.now().year)
          .where('dayType', isEqualTo: selectedType)
          .snapshots();
    } else if (filter == 'Monthly') {
      return FirebaseFirestore.instance
          .collection('Bookings')
          .where('year', isEqualTo: DateTime.now().year)
          .where('week', isEqualTo: selectedType.toString())
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Bookings')
          .where('year', isEqualTo: DateTime.now().year)
          .where('month', isEqualTo: selectedType)
          .snapshots();
    }
  }

  myFilter1() {
    print('called');
    if (filter == 'Weekly') {
      return FirebaseFirestore.instance
          .collection('Bookings')
          .where('year', isEqualTo: DateTime.now().year)
          .where('dayType', isEqualTo: selectedType)
          .where('bookingStatus', isEqualTo: 'Rejected')
          .snapshots();
    } else if (filter == 'Monthly') {
      return FirebaseFirestore.instance
          .collection('Bookings')
          .where('year', isEqualTo: DateTime.now().year)
          .where('week', isEqualTo: selectedType.toString())
          .where('bookingStatus', isEqualTo: 'Rejected')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Bookings')
          .where('year', isEqualTo: DateTime.now().year)
          .where('month', isEqualTo: selectedType)
          .where('bookingStatus', isEqualTo: 'Rejected')
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _index != 0
                    ? IconButton(
                        onPressed: (() {
                          setState(() {
                            _index -= 1;
                          });
                        }),
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 32,
                          color: blueAccent,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: 20,
                ),
                TextBold(text: 'Receipts', fontSize: 28, color: Colors.black),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            IndexedStack(
              index: _index,
              children: [
                Receipts(),
                Types(),
                Data(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Receipts() {
    return Column(
      children: [
        for (int i = 0; i < filters.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: GestureDetector(
              onTap: (() {
                setState(() {
                  _index = 1;
                  filter = filters[i];
                });
              }),
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: blueAccent, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.calendar_month_outlined,
                      color: blueAccent,
                      size: 32,
                    ),
                    title: TextBold(
                        text: filters[i], fontSize: 18, color: blueAccent),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget Types() {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: GridView.builder(
              itemCount: filter == 'Weekly'
                  ? days.length
                  : filter == 'Monthly'
                      ? weeks.length
                      : months.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: GestureDetector(
                    onTap: (() {
                      setState(() {
                        _index = 2;
                        if (filter == 'Weekly') {
                          selectedType = daysValue[index];
                          filterType = days[index];
                        } else if (filter == 'Monthly') {
                          filterType = weeks[index];
                          selectedType = weeksValue[index];
                        } else {
                          filterType = months[index];
                          selectedType = monthsValue[index];
                        }
                      });
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        color: blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: ListTile(
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                          title: TextBold(
                              text: filter == 'Weekly'
                                  ? days[index]
                                  : filter == 'Monthly'
                                      ? weeks[index]
                                      : months[index],
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              })),
        )
      ],
    );
  }

  Widget Data() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: (() {
                        setState(() {
                          print(selectedType);
                        });
                      }),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: blueAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextBold(
                              text: filterType,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: (() {
                        setState(() {});
                      }),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: myFilter(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print('error');
                              return const Center(child: Text('Error'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final data = snapshot.requireData;
                            return Container(
                              height: 90,
                              width: 230,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: blueAccent, width: 1.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.local_taxi_rounded,
                                    color: blueAccent,
                                    size: 58,
                                  ),
                                  title: TextRegular(
                                      text: 'Number of Rides',
                                      fontSize: 14,
                                      color: blueAccent),
                                  subtitle: TextBold(
                                      text: data.docs.length.toString(),
                                      fontSize: 38,
                                      color: blueAccent),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: (() {
                        print(filter);
                        print(selectedType);
                        print(DateTime.now().year.runtimeType);
                      }),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: myFilter1(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print('error');
                              return const Center(child: Text('Error'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                              );
                            }

                            final data = snapshot.requireData;
                            return Container(
                              height: 90,
                              width: 230,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 1.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.taxi_alert,
                                    color: Colors.red,
                                    size: 58,
                                  ),
                                  title: TextRegular(
                                      text: 'Trips Cancelled',
                                      fontSize: 14,
                                      color: Colors.red),
                                  subtitle: TextBold(
                                      text: data.docs.length.toString(),
                                      fontSize: 38,
                                      color: Colors.red),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: myFilter(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print('error');
                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    );
                  }

                  final data = snapshot.requireData;

                  print(data.docs.length);
                  return SizedBox(
                    width: 600,
                    height: 500,
                    child: GridView.builder(
                        itemCount: data.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          double payments = data.docs[index]['payment'];
                          return Card(
                            elevation: 7,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextBold(
                                      text: DateFormat.yMMMd().add_jm().format(
                                          data.docs[index]['dateTime']
                                              .toDate()),
                                      fontSize: 24,
                                      color: blueAccent),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextBold(
                                      text: 'Drivers Name',
                                      fontSize: 12,
                                      color: Colors.grey),
                                  TextBold(
                                      text: data.docs[index]['driverName'],
                                      fontSize: 18,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextBold(
                                      text: 'Passengers Name',
                                      fontSize: 12,
                                      color: Colors.grey),
                                  TextBold(
                                      text: data.docs[index]['userName'],
                                      fontSize: 18,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextBold(
                                      text: 'Destination',
                                      fontSize: 12,
                                      color: Colors.grey),
                                  TextBold(
                                      text: data.docs[index]['userDestination'],
                                      fontSize: 18,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextBold(
                                      text: 'Total Fare',
                                      fontSize: 12,
                                      color: Colors.grey),
                                  TextBold(
                                      text:
                                          '${payments.toStringAsFixed(2)} php',
                                      fontSize: 18,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          );
                        })),
                  );
                }),
          ],
        ),
      ],
    );
  }
}
