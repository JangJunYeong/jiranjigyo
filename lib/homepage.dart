import 'package:flutter/material.dart';
import 'package:jiranjigyo/checkout.dart';
import 'package:jiranjigyo/confirm.dart';
import 'theme.dart';

import 'login.dart';
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
            Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "data:image/jpeg;base64,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"),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 100,
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.centerLeft,
                    child: const Text("로그인 전"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE2B9FF), elevation: 5),
                    child: const Icon(Icons.login),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.0625,
                    height: 50,
                  ),
                ],
              ),
            ),
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
                  SizedBox(
                    height: 300,
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
            Container(
              width: MediaQuery.of(context).size.width * 0.875,
              height: 400,
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: lightColorScheme.secondaryContainer, // 배경 색
                  border:
                      Border.all(width: 1, color: Colors.transparent), // 외곽선 투명
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)) // 곡률
                  ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "공지사항",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.375,
                      ),
                      const Text(
                        "더보기",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
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
            MyTextInput(notifyParent: refresh),
          ],
        ),
      ]),
    );
  }
}

class MyTextInput extends StatefulWidget {
  const MyTextInput({super.key, required this.notifyParent});
  final Function() notifyParent;

  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  final myTitleController = TextEditingController();
  final myTimeController = TextEditingController();
  final myFileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          const Text('제목'),
          TextField(
            controller: myTitleController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("시간"),
          TextField(
            controller: myTimeController,
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                child: const Icon(Icons.done),
                onPressed: () {
                  stepList.add([myTimeController.text, myTitleController.text]);
                  widget.notifyParent();
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.0375,
              ),
              ElevatedButton(
                child: const Icon(Icons.close),
                onPressed: () {
                  stepList = List.empty(growable: true);
                  widget.notifyParent();
                },
              ),
            ],
          )
        ]));
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
