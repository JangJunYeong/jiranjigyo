import 'package:flutter/material.dart';
import 'package:jiranjigyo/checkout.dart';
import 'package:jiranjigyo/confirm.dart';
import 'theme.dart';
import 'widget/loginCard.dart';

import 'reservation.dart';
import 'complaint.dart';

var stepList = List.empty(growable: true);
var index = 1;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const LoginCard(),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              thickness: 1.0,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 30,
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: lightColorScheme.primaryContainer, // 배경 색
                    border: Border.all(
                        width: 1, color: Colors.transparent), // 외곽선 투명
                    borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)) // 곡률
                    ),
                child: Row(
                  children: [
                    const Text(
                      "대충 공지",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.575,
                    ),
                    const Text(
                      "더보기",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              thickness: 1.0,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.875,
              height: 400,
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: lightColorScheme.secondaryContainer, // 배경 색
                  border:
                      Border.all(width: 1, color: Colors.transparent), // 외곽선 투명
                  borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)) // 곡률
                  ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "나의 예약 현황",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      const Text(
                        "더보기",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 3,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: const Text(
                              style: TextStyle(fontSize: 20),
                              '12월28일(목)(day)',
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(style: TextStyle(fontSize: 17), ''),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text(
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 56, 55, 55)),
                                    '예약 수정'),
                                onPressed: () {/* ... */},
                              ),
                              ElevatedButton(
                                child: const Text(
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 56, 55, 55)),
                                    '예약 취소'),
                                onPressed: () {/* ... */},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Column(
                      children: getContent(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    elevation: 6,
                    shape: (RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.375, 60),
                    backgroundColor: lightColorScheme.primaryContainer,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReservationPage()));
                  },
                  child: const Text(
                    "예약",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.125,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    elevation: 6,
                    shape: (RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.375, 60),
                    backgroundColor: lightColorScheme.primaryContainer,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConfirmPage()));
                  },
                  child: const Text(
                    "예약 확인",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    elevation: 6,
                    shape: (RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.375, 60),
                    backgroundColor: lightColorScheme.primaryContainer,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyComplaint()));
                  },
                  child: const Text(
                    "민원",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.125,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.grey,
                    elevation: 6,
                    shape: (RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.375, 60),
                    backgroundColor: lightColorScheme.primaryContainer,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckOutPage()));
                  },
                  child: const Text(
                    "퇴실",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ]),
    );
  }
}

List<Widget> getContent() {
  index = 1;
  List<Widget> tiles = [];
  if (stepList.isEmpty) {
    tiles.add(const Text("empty"));
  } else {
    for (var element in stepList) {
      tiles.add(StepTile(Step(element[0], element[1])));
      index++;
    }
  }
  return tiles;
}

class Step {
  Step(this.title, this.time);

  String title;
  String time;
}

class StepTile extends StatelessWidget {
  StepTile(this._step, {super.key});

  final Step _step;
  final ind = index.toString();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(_step.time),
          leading: Text(ind),
          subtitle: Text(
            _step.title,
            textAlign: TextAlign.right,
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 1.0,
        ),
      ],
    );
  }
}
