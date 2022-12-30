import 'package:flutter/material.dart';
import './widget/bottomtabbar.dart';
import 'package:jiranjigyo/widget/appbar.dart';
import 'package:jiranjigyo/model/student.dart';

var member = 0;
var stepList = List.empty(growable: true);
var mancount = 0;

final List<String> _filters = <String>[];

class DetailPage extends StatefulWidget {
  const DetailPage(this.id, this.name, {Key? key}) : super(key: key);

  final String id;
  final String name;

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
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(AppBar(), "예약 세부사항"),
      bottomNavigationBar: BottomTabBar(0, widget.id, widget.name),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: Container(
          width: 370,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer, // 배경 색
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
                  const Text(style: TextStyle(fontSize: 25), '  예약자 정보'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      // if (member == 6)
                      controllers.add(TextEditingController());
                      member++;
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      controllers.removeLast();
                      member--;
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
                title: const Text(
                    style: TextStyle(fontSize: 17), '이름: 김승민\n학번:201801992'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
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
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shadowColor: Color.fromARGB(255, 183, 179, 179),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          minimumSize: const Size(150, 50),
                          textStyle: const TextStyle(fontSize: 18)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
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
                                                  color: Colors.black,
                                                  fontSize: 20),
                                              '  예약이 완료되었습니다.'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context, 'OK');
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  'OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                      style: TextStyle(color: Colors.black),
                                      'OK'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'CANCLE');
                                  },
                                  child: const Text(
                                      style: TextStyle(color: Colors.black),
                                      'CANCLE'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('확인',
                          style: TextStyle(color: Colors.black)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
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
        