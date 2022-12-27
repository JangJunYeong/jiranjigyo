import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState(){
    super.initState();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/jiransoft_rgb_ko_hv.png'),
                // const SizedBox(height: 16.0),
                // const Text('대충 이미지'),
              ],
            ),
            const SizedBox(height: 120.0),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Colors.grey
                  )
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Portal ID',
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Portal Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  OverflowBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(MediaQuery.of(context).size.width * 0.875, 60),
                            textStyle: const TextStyle(fontSize: 20)
                        ),
                        onPressed: () {
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
            const SizedBox(
              height: 50,
            ),
            const Text("*충남대학교 포털 아이디로 \n접속하실 수 있습니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}