import 'package:flutter/material.dart';
import 'package:jiranjigyo/camera.dart';
import 'package:jiranjigyo/theme.dart';
import './widget/bottomtabbar.dart';

import 'confirm.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        home: Scaffold(
          appBar: AppBar(
              elevation: 4,
              shadowColor: Color.fromARGB(255, 255, 255, 255),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: (Text("반납 후 좌석 촬영")),
              centerTitle: true,
              actions: [Icon(Icons.logout)]),
          body: CameraExample(),
          bottomNavigationBar: const BottomTabBar(3),
        ));
  }
}