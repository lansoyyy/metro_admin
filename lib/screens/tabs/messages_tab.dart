import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/text_widget.dart';

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: TextFormField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search messages",
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
                  height: 30,
                ),
                SizedBox(
                  height: 500,
                  width: 300,
                  child: ListView.builder(itemBuilder: ((context, index) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Image.asset('assets/images/profile.png'),
                        ),
                        trailing: TextBold(
                            text: '10:30 AM',
                            fontSize: 14,
                            color: Colors.black),
                        title: const Text(
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'QRegular'),
                        ),
                        subtitle: const Text(
                          'Chairman - John Doe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'QBold'),
                        ),
                      ),
                    );
                  })),
                )
              ],
            ),
          ),
          const VerticalDivider(),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // Check if message is from sender or receiver
                      bool isSender = index % 2 == 0;

                      // Build chat bubble based on sender/receiver status
                      return Row(
                        mainAxisAlignment: isSender
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: isSender
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                decoration: BoxDecoration(
                                  color: isSender ? blueAccent : secondaryRed,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(20.0),
                                    topRight: const Radius.circular(20.0),
                                    bottomLeft: isSender
                                        ? const Radius.circular(20.0)
                                        : const Radius.circular(0.0),
                                    bottomRight: isSender
                                        ? const Radius.circular(0.0)
                                        : const Radius.circular(20.0),
                                  ),
                                ),
                                child: Text(
                                  'Message ${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextRegular(
                                  text: '01:30 PM',
                                  fontSize: 12,
                                  color: Colors.grey),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Type a message',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
