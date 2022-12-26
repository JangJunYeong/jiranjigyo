//import 'package:contact/theme.dart';
import 'package:flutter/material.dart';


class MyComplaint extends StatelessWidget {

  const MyComplaint({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          //colorScheme: lightColorScheme,
        ),
        home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('민원 내용을 선택해주세요.'),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                          childAspectRatio: 2, //item 의 가로 1, 세로 2 의 비율
                          mainAxisSpacing: 30, //수평 Padding
                          crossAxisSpacing: 30, //수직 Padding
                        ),

                        children: [

                          ElevatedButton(
                            onPressed: () {},
                            child: Text('질문과 답변'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('고장 신고'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('이용 신고'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('분실 신고'),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Text('상세 내용'),
                      SizedBox(height: 30),
                      TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: '내용을 입력해 주세요.',
                        ),
                        maxLines: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    child: const Text('확인'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
        )
    );
  }
}
