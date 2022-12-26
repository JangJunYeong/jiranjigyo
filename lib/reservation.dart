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
                  Tab(child: Text("17")),
                  Tab(child: Text("18")),
                  Tab(child: Text("19")),
                  Tab(child: Text("20")),
                  Tab(child: Text("21")),
                  Tab(child: Text("22")),
                  Tab(child: Text("23")),
                ]
            ),
          ),
            body: TabBarView(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.black
                                  )
                              ),
                              height: 100,
                              width: 100,
                              child: const Text("가"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              child: const Text("나"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              child: const Text("다"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              child: const Text("라"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              child: const Text("마"),
                            ),
                          ],
                        ),
                        Column(
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
                      ],
                    )
                  ),
                  const Icon(Icons.done),
                  const Icon(Icons.done),
                  const Icon(Icons.done),
                  const Icon(Icons.done),
                  const Icon(Icons.done),
                  const Icon(Icons.done),
                ]
            )
        ),
      ),
    );
  }
}
/*
Widget generateCalender {
  return
}*/