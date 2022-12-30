import 'package:flutter/material.dart';
import 'package:jiranjigyo/QRcertify.dart';
import 'package:jiranjigyo/checkout.dart';
import 'package:jiranjigyo/confirm.dart';
import 'theme.dart';
import 'widget/logincard.dart';
import 'package:url_launcher/url_launcher.dart';

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
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const LoginCard(),
              const SizedBox(
                height: 5,
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
                      border:
                      Border.all(width: 1, color: Colors.transparent), // 외곽선 투명
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)) // 곡률
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "대충 공지",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () => {
                            if (getName() == null) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('로그인을 해주세요'),
                                      actions: <Widget>[
                                        ElevatedButton(style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFE2B9FF), elevation: 5),
                                          child: const Text('ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  }
                              )
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmPage(getNumber(), getName())),
                              )
                            }
                          },
                          child: const Text("더보기"))
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
                              '12월28일(목)',
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    style: TextStyle(fontSize: 17),
                                    '14:00~16:00'),
                                ElevatedButton(
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
                                    }
                                )
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfirmPage(getNumber(), getName())),
                                )
                              }
                            },
                            child: const Text("더보기"))
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
                                '12월28일(목)',
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      style: TextStyle(fontSize: 17),
                                      '14:00~16:00'),
                                  ElevatedButton(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReservationPage(getNumber(), getName())));
                    }
                  },
                  child: const Text(
                    "예약",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.125,
                  ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmPage(getNumber(), getName())));
                    }
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyComplaint(getNumber(), getName())));
                    }
                  },
                  child: const Text(
                    "민원",
                    style: TextStyle(
                      fontSize: 25,

                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.125,
                  ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOutPage(getNumber(), getName())));
                    }
                  },
                  child: const Text(
                    "퇴실",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          ],
        )
    );
  }
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
