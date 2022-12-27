import 'package:flutter/material.dart';
import 'package:jiranjigyo/model/student.dart';
import 'package:jiranjigyo/theme.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: DetailCard(
          title: '세부사항',
          student: Student(id: '201801992', name: '김승민'),
          tableIndex: 3,
          time: DateTime.now(),
        ),
      ),
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
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            opened = !opened;
          });
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(widget.title),
                    const SizedBox(height: 15.0),
                    Text('학번: ${widget.student.id}'),
                    Text('이름: ${widget.student.name}'),
                  ],
                ),
                if (opened)
                  Column(
                    children: [
                      Text('테이블: ${widget.tableIndex}'),
                      Text('시간: ${widget.time}'),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
