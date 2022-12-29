import 'package:flutter/material.dart';

import '../reservation.dart';
import '../confirm.dart';
import '../complaint.dart';
import '../checkout.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar(this.nowpage, this.id, this.name, {Key? key})
      : super(key: key);
  final int nowpage;
  final String id;
  final String name;

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

  void tabMove(int index) {
    switch (index) {
      case 0:
        if (widget.nowpage == 0) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReservationPage(widget.id, widget.name)));
        }
        break;
      case 1:
        if (widget.nowpage == 1) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ConfirmPage(widget.id, widget.name)));
        }
        break;
      case 2:
        if (widget.nowpage == 2) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyComplaint(widget.id, widget.name)));
        }
        break;
      case 3:
        if (widget.nowpage == 3) {
          refresh();
        } else {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CheckOutPage(widget.id, widget.name)));
        }
        break;
    }
  }

  void tabIndex(int tabindex) {
    setState(() {
      index = tabindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.nowpage,
      onTap: (int index) {
        tabIndex(index);
        tabMove(index);
      },
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "예약",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "예약확인"),
        BottomNavigationBarItem(icon: Icon(Icons.report), label: "민원"),
        BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: "퇴실"),
      ],
    );
  }
}
