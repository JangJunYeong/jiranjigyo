import 'package:flutter/material.dart';
import '../model/student.dart';
import '../QRcertify.dart';
import 'logincard.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key,
    required this.homepage,
    required this.title,
    required this.student,
    required this.table,
    required this.time,
    this.students,
  });

  final bool homepage;
  final String title;
  final Student student;
  final String table;
  final String time;
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
            if(!widget.homepage) {
              opened = !opened;
            }
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
                      if(!widget.homepage) IconButton(
                        icon: Icon(opened ? Icons.remove : Icons.add),
                        onPressed: () {
                          setState(() {
                            opened = !opened;
                          });
                        },
                      ),
                      if (widget.homepage) ElevatedButton(
                        child: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 56, 55, 55)),
                            '인증하기'),
                        onPressed: () {
                          if (getName() == null) {
                            showDialog(
                                context: context,
                                barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('로그인을 해주세요'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFE2B9FF), elevation: 5),
                                        child: const Text('ok'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                }
                            );
                          } else {
                            // QRcertify 페이지로 이동
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const QRcertifyPage()));
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(
                    height: 5.0,
                  ),
                  if(widget.homepage) Text(
                      style: const TextStyle(fontSize: 17),
                      widget.time),
                  if(!widget.homepage) ListTile(
                    title: Text(
                        style: const TextStyle(fontSize: 17),
                        widget.time),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/table.png"),
                      maxRadius: 25,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(!widget.homepage) Text(
                            style: const TextStyle(fontSize: 17),
                            '예약자 이름:${widget.student.name}'),
                        if (opened)
                          Column(
                            children: [
                              Text(
                                  style: const TextStyle(fontSize: 17),
                                  '테이블: ${widget.table}'),
                              Text(
                                  style: const TextStyle(fontSize: 17),
                                  '조원:${widget.students}'),
                            ],
                          ),
                      ],
                    ),
                  ),
                  if(!widget.homepage) Row(
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
