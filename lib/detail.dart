import 'package:flutter/material.dart';
import './widget/bottomtabbar.dart';

final List<String> _filters = <String>[];
int count = 0;

class DetailPage extends StatefulWidget{
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text("예약 세부사항"),
              ],
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: const BottomTabBar(0),
        ),
      ),
    );
  }
}
