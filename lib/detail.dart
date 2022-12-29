import 'package:flutter/material.dart';
import './widget/bottomtabbar.dart';
import 'package:jiranjigyo/widget/appbar.dart';
import 'package:jiranjigyo/model/student.dart';

var stepList = List.empty(growable: true);
var mancount = 0;

final List<String> _filters = <String>[];

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<TextEditingController> controllers = [];
  @override
  void initState() {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: Container(
          width: 370,
          decoration: BoxDecoration(
              color: Colors.grey, // 배경 색
              border: Border.all(width: 1, color: Colors.transparent), // 외곽선 투명
              borderRadius: const BorderRadius.all(Radius.circular(8.0)) // 곡률
              ),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(style: TextStyle(fontSize: 25), '  예약자 정보'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      controllers.add(TextEditingController());
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const SizedBox(
                height: 5.0,
              ),
              ListTile(
                title: Text(
                    style: TextStyle(fontSize: 17), '이름: 김승민\n학번:201801992'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
                    Column(
                      children: controllers.map((controller) {
                        return TextFormField(
                          controller: controller,
                          decoration: const InputDecoration(
                            filled: true,
                            labelText: '학번:',
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

        /*showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            '주의사항'),
                        content: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 90, 89, 89),
                                fontSize: 15),
                            '사용시작 시간 이후 30분 내로 QR인증을 해주시지 않으면 예약 취소 및 패널티가 부과될수 있습니다.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'OK');
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Icon(Icons.check),
                                    content: const Text(
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                        '예약이 완료되었습니다.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'OK');
                                        },
                                        child: const Text(
                                            style:
                                                TextStyle(color: Colors.black),
                                            'OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                                style: TextStyle(color: Colors.black), 'OK'),
                          ),
                        ],
                      );
                    },
                  );*/
        );
  }
}
