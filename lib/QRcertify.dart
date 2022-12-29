import 'package:flutter/material.dart';
import 'package:jiranjigyo/widget/camera.dart';
import './widget/bottomtabbar.dart';
import './widget/appbar.dart';

import 'confirm.dart';
import 'widget/bottomtabbar.dart';

class QRcertifyPage extends StatefulWidget {
  const QRcertifyPage({Key? key}) : super(key: key);

  @override
  State<QRcertifyPage> createState() => _QRcertifyPageState();
}

class _QRcertifyPageState extends State<QRcertifyPage> {
  // int index = 3;
  // int? checkedIndex;

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
      appBar: AppBarWidget(AppBar(), "QR인증"),
      body: const CameraExample(),
      // bottomNavigationBar: const BottomTabBar(3), // bottomNavigationBar 필요없음
    );
  }
}
