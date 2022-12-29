import 'package:flutter/material.dart';
import 'package:jiranjigyo/model/student.dart';
import './widget/bottomtabbar.dart';
import 'package:jiranjigyo/widget/appbar.dart';

int index = 0;

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

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
      bottomNavigationBar: const BottomTabBar(1),
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
        child: Container(
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
                          style: TextStyle(fontSize: 20), '   ' + widget.title),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ListTile(
                    title: Text(
                      style: TextStyle(fontSize: 20),
                      'time->time',
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/table.png"),
                      maxRadius: 25,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: TextStyle(fontSize: 17),
                            '예약자 이름:' + widget.student.name),
                        if (opened)
                          Column(
                            children: [
                              Text(
                                  style: TextStyle(fontSize: 17),
                                  '테이블: ${widget.tableIndex}'),
                              Text(
                                  style: TextStyle(fontSize: 17),
                                  '조원:' + widget.students.toString()),
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
                        onPressed: () {/* ... */},
                      ),
                      ElevatedButton(
                        child: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 56, 55, 55)),
                            '일정 공유'),
                        onPressed: () {/* ... */},
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
