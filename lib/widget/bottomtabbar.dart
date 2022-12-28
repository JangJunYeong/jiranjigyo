import 'package:flutter/material.dart';

import '../reservation.dart';
import '../confirm.dart';
import '../complaint.dart';
import '../checkout.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar(this.nowpage, {Key? key}) : super(key: key);
  final int nowpage;

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    setState(() {});
  }

  void TabMove(int index) {
    switch (index) {
      case 0:
        if (widget.nowpage == 0) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ReservationPage()));
        }
        break;
      case 1:
        if (widget.nowpage == 1) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ConfirmPage()));
        }
        break;
      case 2:
        if (widget.nowpage == 2) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyComplaint()));
        }
        break;
      case 3:
        if (widget.nowpage == 3) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CheckOutPage()));
        }
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
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.nowpage,
      onTap: (int index) {
        TabIndex(index);
        TabMove(index);
      },
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "예약",),
        BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "예약확인"),
        BottomNavigationBarItem(icon: Icon(Icons.report), label: "민원"),
        BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: "퇴실"),
      ],
    );
  }
}
