import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/text_widget.dart';

class PassengersTab extends StatelessWidget {
  const PassengersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                      hintText: "Search passenger's name",
                      hintStyle: TextStyle(fontFamily: 'QRegular'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: ((context, index) {
                      return DefaultTabController(
                        length: 3,
                        child: Card(
                          elevation: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: iconColor,
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const CircleAvatar(
                                  minRadius: 40,
                                  maxRadius: 40,
                                  backgroundColor: Colors.grey,
                                ),
                                const TabBar(
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.white,
                                    labelStyle: TextStyle(
                                        fontFamily: 'QBold',
                                        color: Colors.black,
                                        fontSize: 10),
                                    tabs: [
                                      Tab(
                                        text: 'Details',
                                      ),
                                      Tab(
                                        text: 'Transactions',
                                      ),
                                      Tab(
                                        text: 'Emergency',
                                      )
                                    ]),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 3, 20, 3),
                                    child: SizedBox(
                                      child: TabBarView(children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextBold(
                                                text: 'John Doe',
                                                fontSize: 18,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextBold(
                                                text: 'Contact #: 09090104355',
                                                fontSize: 14,
                                                color: Colors.black),
                                            TextBold(
                                                text: 'Email: doe@gmail.com',
                                                fontSize: 14,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextBold(
                                                text:
                                                    'Province, City, Baranggay',
                                                fontSize: 14,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          child: ListView.builder(
                                              itemBuilder: ((context, index) {
                                            return Card(
                                                child: ListTile(
                                              title: TextBold(
                                                  text: 'Destination',
                                                  fontSize: 12,
                                                  color: Colors.black),
                                              subtitle: TextRegular(
                                                  text: 'Date and Time',
                                                  fontSize: 9,
                                                  color: Colors.black),
                                              trailing: TextBold(
                                                  text: '400.00',
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ));
                                          })),
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextBold(
                                                      text: 'Person 1',
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextBold(
                                                      text:
                                                          'Contact #: 09090104355',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  TextBold(
                                                      text: 'Address: address',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextBold(
                                                      text: 'Person 2',
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextBold(
                                                      text:
                                                          'Contact #: 09090104355',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  TextBold(
                                                      text: 'Address: address',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
