import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/text_widget.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class PassengersTab extends StatefulWidget {
  const PassengersTab({Key? key}) : super(key: key);

  @override
  State<PassengersTab> createState() => _PassengersTabState();
}

class _PassengersTabState extends State<PassengersTab> {
  late String filter = '';
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
                    onChanged: (value) {
                      setState(() {
                        filter = value;
                      });
                    },
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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('firstName',
                          isGreaterThanOrEqualTo:
                              toBeginningOfSentenceCase(filter))
                      .where('firstName',
                          isLessThan: '${toBeginningOfSentenceCase(filter)}z')
                      .snapshots(),
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
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                      child: GridView.builder(
                          itemCount: data.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: ((context, index) {
                            final passData = data.docs[index];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CircleAvatar(
                                        minRadius: 40,
                                        maxRadius: 40,
                                        backgroundColor: Colors.grey,
                                        backgroundImage: NetworkImage(
                                            '${passData['profilePicture']}'),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 3, 20, 3),
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
                                                      text:
                                                          '${passData['firstName']} ${passData['lastName']}',
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextBold(
                                                      text:
                                                          'Contact #: ${passData['contactNumber']}',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  TextBold(
                                                      text:
                                                          'Email: ${passData['email']}',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextBold(
                                                      text:
                                                          '${passData['province']}, ${passData['city']}, ${passData['brgy']}',
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                              StreamBuilder<QuerySnapshot>(
                                                  stream: FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                          'User History')
                                                      .where('userId',
                                                          isEqualTo:
                                                              passData.id)
                                                      .snapshots(),
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                    if (snapshot.hasError) {
                                                      print('error');
                                                      return const Center(
                                                          child: Text('Error'));
                                                    }
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 50),
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                          color: Colors.black,
                                                        )),
                                                      );
                                                    }

                                                    final data =
                                                        snapshot.requireData;
                                                    return SizedBox(
                                                      child: ListView.builder(
                                                          itemCount:
                                                              data.docs.length,
                                                          itemBuilder:
                                                              ((context,
                                                                  index) {
                                                            String
                                                                formattedDate =
                                                                DateFormat(
                                                                        'yyyy-MMM-dd hh:mm')
                                                                    .format(data
                                                                        .docs[
                                                                            index]
                                                                            [
                                                                            'dateTime']
                                                                        .toDate());

                                                            // format the DateTime object using the formatter

                                                            return Card(
                                                                child: ListTile(
                                                              title: TextBold(
                                                                  text: data.docs[
                                                                          index]
                                                                      [
                                                                      'destinationLocation'],
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black),
                                                              subtitle: TextRegular(
                                                                  text:
                                                                      formattedDate,
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .black),
                                                              trailing: TextBold(
                                                                  text: data
                                                                          .docs[
                                                                              index]
                                                                              [
                                                                              'payment']
                                                                          .toStringAsFixed(
                                                                              2) ??
                                                                      '',
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            ));
                                                          })),
                                                    );
                                                  }),
                                              SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextBold(
                                                            text:
                                                                '${passData['contactName1']}',
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextBold(
                                                            text:
                                                                'Contact #: ${passData['contactNumber1']}',
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black),
                                                        TextBold(
                                                            text:
                                                                'Address: ${passData['contactAddress1']}',
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextBold(
                                                            text:
                                                                '${passData['contactName2']}',
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextBold(
                                                            text:
                                                                'Contact #: ${passData['contactNumber2']}',
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black),
                                                        TextBold(
                                                            text:
                                                                'Address: ${passData['contactAddress2']}',
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black),
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
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
