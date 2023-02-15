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
                      hintText: "Search driver's name",
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
                      return Card(
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
                              const CircleAvatar(
                                minRadius: 50,
                                maxRadius: 50,
                                backgroundColor: Colors.grey,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBold(
                                      text: 'Assigned Driver: John Doe',
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextBold(
                                      text: 'Contact #: 09090104355',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextBold(
                                      text: 'Toyota Vios 2020',
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextBold(
                                      text: 'Color: White',
                                      fontSize: 14,
                                      color: Colors.black),
                                  TextBold(
                                      text: 'Plate #: 123456',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              TextBold(
                                  text: 'On Duty',
                                  fontSize: 18,
                                  color: Colors.black),
                            ],
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
