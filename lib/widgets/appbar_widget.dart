import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/text_widget.dart';

PreferredSizeWidget customAppbar(String title) {
  return AppBar(
    title: TextRegular(text: title, fontSize: 18, color: Colors.white),
    centerTitle: true,
    foregroundColor: Colors.white,
    elevation: 0,
    backgroundColor: primaryRed,
  );
}
