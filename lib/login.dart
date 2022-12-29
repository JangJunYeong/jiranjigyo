import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:jiranjigyo/theme.dart';
import 'package:jiranjigyo/widget/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

//dart firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(AppBar(), "로그인"),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                Image.asset('assets/jiransoft_rgb_ko_hv.png', width: 260, height: 130),
                // const SizedBox(height: 16.0),
                // const Text('대충 이미지'),
              ],
            ),
            const SizedBox(height: 60.0),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      //color: lightColorScheme.outline
                        color: Colors.transparent // 감싸는 사각형 투명색
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: '학교 이메일',
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: '비밀번호',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16.0),
                  OverflowBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: (RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                            )
                          ),
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.875, 60),
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,

    ),
                        onPressed: () async {
                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _usernameController.text,
                            password: _passwordController.text,
                          );

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(userCredential.user == null ? '로그인 실패' : '로그인 성공')),
                          );
                          // FirebaseFirestore.instance.collection('users').add({
                          //   'name': userCredential.user!.displayName,
                          //   'email': _usernameController.text,
                          // });
                          //
                          // var data = await FirebaseFirestore.instance.collection('users').doc('202002564').get();
                          // var json = data.data();
                          // json!['email'];

                          _usernameController.clear();
                          _passwordController.clear();
                          Navigator.pop(context);

                        },
                        child: const Text('로그인'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}