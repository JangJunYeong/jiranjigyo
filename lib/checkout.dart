import 'package:flutter/material.dart';
import 'package:jiranjigyo/complaint.dart';
import 'package:jiranjigyo/theme.dart';
import 'package:jiranjigyo/reservation.dart';


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
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      home: GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text("반납 후 좌석 활영"),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (int index) {
              TabIndex(index);
              TabMove(index);
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.done),
                label: "예약",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "예약확인"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "민원"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "퇴실"
              ),
            ],
          ),
          ),
        ),
      );
  }
  
}