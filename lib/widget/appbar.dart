import 'package:flutter/material.dart';
import 'package:jiranjigyo/login.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget(this.appBar, this.pagename, {Key? key, this.hasTab = false})
      : super(key: key);

  final String pagename;
  final AppBar appBar;
  final bool hasTab;

  final DateTime nowday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (hasTab == true) {
      return AppBar(
        elevation: 4,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        title: (Text("$pagename (${nowday.year}년 ${nowday.month}월)")),
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(Icons.logout),
            onPressed: () => {
              Navigator.pop(context),
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()
                ),
              )
            },
          )
        ],
        bottom: TabBar(tabs: [
          Tab(
              child: Text(
            dayCal(nowday.day),
            style: const TextStyle(color: Colors.black),
          )),
          Tab(
              child: Text(
            dayCal(nowday.day + 1),
            style: const TextStyle(color: Colors.black),
          )),
          Tab(
              child: Text(
            dayCal(nowday.day + 2),
            style: const TextStyle(color: Colors.black),
          )),
          Tab(
              child: Text(
            dayCal(nowday.day + 3),
            style: const TextStyle(color: Colors.black),
          )),
          Tab(
              child: Text(
            dayCal(nowday.day + 4),
            style: const TextStyle(color: Colors.black),
          )),
          Tab(
              child: Text(
            dayCal(nowday.day + 5),
            style: const TextStyle(color: Colors.black),
          )),
          Tab(
              child: Text(
            dayCal(nowday.day + 6),
            style: const TextStyle(color: Colors.black),
          )),
        ]),
      );
    } else {
      return AppBar(
          elevation: 4,
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          title: (Text(pagename)),
          centerTitle: true,
          actions: [
            IconButton(
              icon:Icon(Icons.logout),
              onPressed: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage()
                  ),
                )
              },
            )
          ]
      );
    }
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appBar.preferredSize.height + (hasTab ? 30 : 0));

  dayCal(int inputday) {
    int day = inputday;

    if (nowday.month == 2) {
      day = inputday - 28;
    } else if (nowday.month < 8) {
      if (nowday.month % 2 == 0 && inputday > 30) {
        day = inputday - 30;
      } else if (inputday > 31) {
        day = inputday - 31;
      }
    } else {
      if (nowday.month % 2 == 1 && inputday > 30) {
        day = inputday - 30;
      } else if (inputday > 31) {
        day = inputday - 31;
      }
    }

    return day.toString();
  }
}
