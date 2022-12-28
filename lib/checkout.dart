import 'package:flutter/material.dart';
import 'package:jiranjigyo/camera.dart';
import 'package:jiranjigyo/complaint.dart';
import 'package:jiranjigyo/theme.dart';
import 'package:jiranjigyo/reservation.dart';
import './widget/bottomtabbar.dart';

import 'confirm.dart';


class CheckOutPage extends StatefulWidget{
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage>{
  int index = 3;
  int? checkedIndex;

  @override
  void initState(){
    super.initState();
  }
  void refresh() {
    setState(() {});
  }

  void TabMove(int index) {
    switch(index) {
      case 0 :
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReservationPage())
        );
        break;
      case 1 :
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfirmPage())
        );
        break;
      case 2 :
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyComplaint())
        );
        break;
      case 3 :
        refresh();
        break;
    }
  }

  void TabIndex(int Tabindex) {
    setState(() {
      index = Tabindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            title: (
                Text("반납 후 좌석 촬영")
            ),
              centerTitle:true,
              actions: [
                Icon(Icons.logout)
              ]
          ),
          body: CameraExample(),
          bottomNavigationBar: const BottomTabBar(3),
        )
    );
  }
}