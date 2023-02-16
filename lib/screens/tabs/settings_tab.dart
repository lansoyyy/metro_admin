import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/text_widget.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                        text: 'User Management',
                        fontSize: 18,
                        color: Colors.black),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(itemBuilder: ((context, index) {
                        return Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: ListTile(
                              leading: const CircleAvatar(
                                maxRadius: 50,
                                minRadius: 50,
                              ),
                              title: TextBold(
                                  text: 'COOPERATIVE - CHAIRMAN',
                                  fontSize: 14,
                                  color: Colors.black),
                              subtitle: TextRegular(
                                  text: 'Admin 1',
                                  fontSize: 12,
                                  color: Colors.grey),
                              trailing: IconButton(
                                onPressed: (() {}),
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: 400,
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const CircleAvatar(
                          maxRadius: 50,
                          minRadius: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                            text: 'John Doe',
                            fontSize: 18,
                            color: Colors.black),
                        TextRegular(
                            text: 'Full Name',
                            fontSize: 12,
                            color: Colors.grey),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                            text: 'doe@gmail.com',
                            fontSize: 18,
                            color: Colors.black),
                        TextRegular(
                            text: 'Email Address',
                            fontSize: 12,
                            color: Colors.grey),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                            text: '09090104355',
                            fontSize: 18,
                            color: Colors.black),
                        TextRegular(
                            text: 'Contact Number',
                            fontSize: 12,
                            color: Colors.grey),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                            text: 'Makati City, Philippines',
                            fontSize: 18,
                            color: Colors.black),
                        TextRegular(
                            text: 'Complete Address',
                            fontSize: 12,
                            color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
