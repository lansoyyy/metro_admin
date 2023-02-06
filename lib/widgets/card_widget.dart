import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';

class CardWidget extends StatelessWidget {
  final Widget widget;

  const CardWidget({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 5,
          child: Container(
            height: 120,
            width: 250,
            decoration: BoxDecoration(
              color: tileColorDashboard,
            ),
            child: Center(child: widget),
          ),
        ),
      ),
    );
  }
}
