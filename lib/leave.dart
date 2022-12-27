import 'package:flutter/material.dart';
import 'complaint.dart';
import 'confirm.dart';

final List<String> _filters = <String>[];
int count = 0;

class LeavePage extends StatefulWidget{
  const LeavePage({Key? key}) : super(key: key);

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  int index = 0;

  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose() {
    _filters.clear();
    count = 0;
    super.dispose();
  }
  void refresh() {
    setState(() {});
  }

  void TabMove(int index) {
    switch(index) {
      case 0 :
        refresh();
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
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
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