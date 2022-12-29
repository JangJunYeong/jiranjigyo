import 'package:flutter/material.dart';
import 'package:jiranjigyo/model/student.dart';
import './widget/bottomtabbar.dart';
import 'package:jiranjigyo/widget/appbar.dart';

int index = 0;

class ConfirmPage extends StatelessWidget {
  const ConfirmPage(this.id, this.name, {super.key});

  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(AppBar(), "예약확인"),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Align(
          alignment: Alignment.topCenter,
          child: DetailCard(
            title: '2022.12.28(목)',
            student: Student(id: '201801992', name: '김승민'),
            tableIndex: 3,
            time: DateTime.now(),
          ),
        ),
      ),
      bottomNavigationBar: BottomTabBar(1, id, name),
    );
  }
}

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key,
    required this.title,
    required this.student,
    required this.tableIndex,
    required this.time,
    this.students,
  });

  final String title;
  final Student student;
  final int tableIndex;
  final DateTime time;
  final List<Student>? students;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 4,
      color: Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            opened = !opened;
          });
        },
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          width: 370,
          child: Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          style: const TextStyle(fontSize: 20),
                          '   ${widget.title}'),
                      IconButton(
                        icon: Icon(opened ? Icons.remove : Icons.add),
                        onPressed: () {
                          setState(() {
                            opened = !opened;
                          });
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
                      style: TextStyle(fontSize: 20),
                      'time->time',
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/table.png"),
                      maxRadius: 25,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: const TextStyle(fontSize: 17),
                            '예약자 이름:${widget.student.name}'),
                        if (opened)
                          Column(
                            children: [
                              Text(
                                  style: const TextStyle(fontSize: 17),
                                  '테이블: ${widget.tableIndex}'),
                              Text(
                                  style: const TextStyle(fontSize: 17),
                                  '조원:${widget.students}'),
                            ],
                          ),
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
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('예약취소'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text('예약을 취소하시겠습니까?'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text(
                                            style:
                                                TextStyle(color: Colors.black),
                                            'ok'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
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
                                                    '  예약이 취소되었습니다.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, 'OK');
                                                    },
                                                    child: const Text(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        'OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      ElevatedButton(
                                        child: const Text(
                                            style:
                                                TextStyle(color: Colors.black),
                                            'cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }),
                      ElevatedButton(
                        child: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 56, 55, 55)),
                            '일정 공유'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actions: <Widget>[
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          child: const CircleAvatar(
                                            backgroundImage:
                                                AssetImage("assets/mail.png"),
                                            maxRadius: 15,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        const Padding(padding: EdgeInsets.all(3)),
                                        ElevatedButton(
                                          child: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/kakaotalk.png"),
                                            maxRadius: 15,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        const Padding(padding: EdgeInsets.all(3)),
                                        ElevatedButton(
                                          child: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/facebook.png"),
                                            maxRadius: 15,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        const Padding(padding: EdgeInsets.all(3)),
                                        ElevatedButton(
                                          child: const CircleAvatar(
                                            backgroundImage:
                                                AssetImage("assets/instar.png"),
                                            maxRadius: 15,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
