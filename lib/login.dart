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
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Portal Password',
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
              height: 100,
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