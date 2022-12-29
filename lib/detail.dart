import 'package:flutter/material.dart';
import './widget/bottomtabbar.dart';
import 'package:jiranjigyo/widget/appbar.dart';

var stepList = List.empty(growable: true);
var mancount = 0;

final List<String> _filters = <String>[];

class DetailPage extends StatefulWidget{
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose() {
    _filters.clear();
    mancount = 0;
    super.dispose();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(AppBar(), "예약 세부사항"),
      bottomNavigationBar: const BottomTabBar(0),
      body:
      ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
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
                    border: Border.all(width: 1, color: Colors.black)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 390,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: getContent(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ]
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: MyTextInput(notifyParent: refresh),
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
  mancount = 1;
  List<Widget> tiles = [];
  if (stepList.isEmpty) {
    tiles.add(const Text("empty"));
  } else {
    for (var element in stepList) {
      tiles.add(StepTile(Step(element[0], element[1])));
      mancount++;
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
  final ind = mancount.toString();

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

