import 'package:flutter/material.dart';

import '../login.dart';

String? userName;
String? userNumber;

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    setState(() {});
  }

  setName(String? inp) {
    userName = inp;
    refresh();
  }
  setNumber(String? inp) {
    userNumber = inp;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                backgroundImage: AssetImage("assets/profile.png"),
                maxRadius: 25,
              )),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 100,
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
            child: Text(
                style: const TextStyle(fontSize: 20),
                (userName ?? '로그인 전${userName == null ? '' : '님'}')),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE2B9FF), elevation: 5),
            child: userName != null ? const Icon(Icons.logout) : const Icon(Icons.login),
            onPressed: () async {
              if (userName != null) {
                userName = null;
                userNumber = null;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              } else {
                List userData = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                userName = userData[0];
                userNumber = userData[1];
              }
              setState(() {});
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.0625,
            height: 50,
          ),
        ],
      ),
    );
  }
}

getName() {
  return userName;
}
getNumber() {
  return userNumber;
}
