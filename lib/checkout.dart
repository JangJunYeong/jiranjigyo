import 'package:flutter/material.dart';
import 'package:jiranjigyo/widget/camera.dart';
import './widget/bottomtabbar.dart';
import './widget/appbar.dart';

import 'confirm.dart';
import 'widget/bottomtabbar.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int index = 3;
  int? checkedIndex;

  @override
  void initState() {
    super.initState();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(AppBar(), "반납 후 좌석 촬영"),
      body: const CameraExample(),
      bottomNavigationBar: const BottomTabBar(0),
    );
  }
}
