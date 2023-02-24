import 'package:flutter/material.dart';
import 'package:metro_admin/utils/colors.dart';
import 'package:metro_admin/widgets/text_widget.dart';

PreferredSizeWidget customAppbar(page, page1) {
  return AppBar(
    foregroundColor: Colors.white,
    elevation: 0,
    backgroundColor: secondaryRed,
    actions: [
      IconButton(
          onPressed: (() {
            page.jumpToPage(0);
            page1.changePage(0);
          }),
          icon: const Icon(Icons.email)),
      const SizedBox(
        width: 20,
      ),
      const Icon(Icons.account_circle),
      const SizedBox(
        width: 10,
      ),
      Center(
          child: TextBold(
              text: 'TAXI REGION 2', fontSize: 16, color: Colors.white)),
      const SizedBox(
        width: 20,
      ),
    ],
  );
}
