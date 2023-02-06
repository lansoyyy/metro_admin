import 'package:flutter/material.dart';
import 'package:metro_admin/widgets/appbar_widget.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Container(),
    );
  }
}
