import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget(this.appBar, this.pagename, {Key? key, this.hasTab = false}) : super(key: key);

  final String pagename;
  final AppBar appBar;
  final bool hasTab;

  @override
  Widget build(BuildContext context) {
    if (pagename == "예약"){
      return AppBar(
          elevation: 4,
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: (Text(pagename)),
          centerTitle: true,
          actions: const [Icon(Icons.logout)],
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("17", style: TextStyle(color: Colors.black),)),
              Tab(child: Text("18", style: TextStyle(color: Colors.black),)),
              Tab(child: Text("19", style: TextStyle(color: Colors.black),)),
              Tab(child: Text("20", style: TextStyle(color: Colors.black),)),
              Tab(child: Text("21", style: TextStyle(color: Colors.black),)),
              Tab(child: Text("22", style: TextStyle(color: Colors.black),)),
              Tab(child: Text("23", style: TextStyle(color: Colors.black),)),
            ]
        ),
      );
    } else {
      return AppBar(
          elevation: 4,
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: (Text(pagename)),
          centerTitle: true,
          actions: const [Icon(Icons.logout)]);
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height + (hasTab ? 30 : 0));
}