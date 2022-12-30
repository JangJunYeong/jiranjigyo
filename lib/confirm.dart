import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiranjigyo/model/student.dart';
import './widget/bottomtabbar.dart';
import 'package:jiranjigyo/widget/appbar.dart';
import './widget/detailcard.dart';

int index = 0;

class ConfirmPage extends StatelessWidget {
  const ConfirmPage(this.id, this.name, {super.key});

  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(AppBar(), "예약확인"),
      body: Container(
        padding: const EdgeInsets.all(18),
        alignment: Alignment.topCenter,
        child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('reservations').get(),
            builder: (context, snapshot) {
              var docs = snapshot.data?.docs;

              if (docs == null) return Container();
              return ListView(
                children: docs.map((doc) {
                  Map<String, dynamic> json = doc.data() as Map<String, dynamic> ?? {};
                  return DetailCard(
                    homepage: false,
                    title: json['day'],
                    student: Student(id: id, name: name),
                    table: json['table'],
                    time: json['time'].join(', '),
                  );
                }).toList(),
              );
            }
        ),
      ),
      bottomNavigationBar: BottomTabBar(1, id, name),
    );
  }
}