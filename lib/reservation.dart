import 'package:flutter/material.dart';

Set<String> SelectMap = {
  "예약",
  "예약 확인",
  "민원",
  "퇴실"
};

class ReservationPage extends StatefulWidget{
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {

  @override
  void initState(){
    super.initState();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _filters = <String>[];

    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("예약"),
            bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.done)),
                  Tab(icon: Icon(Icons.done)),
                  Tab(icon: Icon(Icons.done)),
                  Tab(icon: Icon(Icons.done)),
                  Tab(icon: Icon(Icons.done)),
                  Tab(icon: Icon(Icons.done)),
                  Tab(icon: Icon(Icons.done)),
                ]
            ),
          ),
            body: TabBarView(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Wrap(
                            spacing: 5.0,
                            children: SelectMap.map((String select) {
                              //var name = SelectMap[select.name];
                              return FilterChip(
                                  label: Text(select),
                                  selected: _filters.contains(select),
                                  onSelected: (bool value){
                                    setState(() {
                                      if (value) {
                                        if (!_filters.contains(select)) {
                                          _filters.add(select);
                                        }
                                      } else {
                                        _filters.removeWhere((String name) {
                                          return name == select;
                                        });
                                      }
                                    });
                                  });
                            }).toList()
                        ),
                        const SizedBox(height: 10.0),
                        Text('Looking for: ${_filters.join(', ')}'),
                      ],
                    ),
                  ),
                  const Icon(Icons.done),
                  const Icon(Icons.done),
                  Icon(Icons.done),
                  Icon(Icons.done),
                  Icon(Icons.done),
                  Icon(Icons.done),
                ]
            )
        ),
      ),
    );
  }
}