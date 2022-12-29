import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiranjigyo/widget/bottomtabbar.dart';
import 'package:jiranjigyo/widget/appbar.dart';

class ComplaintButton extends StatelessWidget {
  const ComplaintButton({
    Key? key,
    required this.text,
    this.checked = false,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final bool checked;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: checked
          ? const Color(0xFFC4C6D6)
          : Theme.of(context).colorScheme.secondaryContainer,
      elevation: 8,
      shadowColor: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}

class MyComplaint extends StatefulWidget {
  const MyComplaint(this.id, this.name, {Key? key}) : super(key: key);

  final String id;
  final String name;

  @override
  State<MyComplaint> createState() => _MyComplaintState();
}

class _MyComplaintState extends State<MyComplaint> {
  List postList = [];
  int index = 2;
  int? checkedIndex;
  final textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    postList = [];
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> contents = [
      '질문과 답변',
      '고장 신고',
      '이용 신고',
      '분실 신고',
    ];

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(AppBar(), "민원 등록"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('민원 내용을 선택해주세요.'),
                  const SizedBox(height: 25),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: contents.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 2, //item 의 가로 1, 세로 2 의 비율
                      mainAxisSpacing: 20, //수평 Padding
                      crossAxisSpacing: 20, //수직 Padding
                    ),
                    itemBuilder: (context, index) {
                      return ComplaintButton(
                        text: contents[index],
                        checked: checkedIndex == index,
                        onPressed: () {
                          setState(() {
                            checkedIndex = index;
                            postList = [];
                            postList.add((contents[index]));
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text('상세 내용'),
                  const SizedBox(height: 20),
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: '내용을 입력해 주세요.',
                    ),
                    maxLines: 8,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 6,
                    shadowColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    minimumSize: const Size(150, 50),
                    textStyle: const TextStyle(fontSize: 18)),
                onPressed: () {
                  postList.add(textController.text);
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  firestore.collection('complaints').add(
                      {'complaintsType': postList[0],
                        'complaintsText': postList[1],
                      });
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Icon(Icons.check),
                        content: const Text(
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            '제출이 완료되었습니다.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'OK');
                              Navigator.pop(context);
                            },
                            child: const Text(
                                style: TextStyle(color: Colors.black), 'OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('확인', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomTabBar(2, widget.id, widget.name),
      ),
    );
  }
}
