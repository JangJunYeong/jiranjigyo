import 'package:flutter/material.dart';
import 'package:jiranjigyo/reservation.dart';
import 'package:jiranjigyo/theme.dart';


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
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(text,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}


class MyComplaint extends StatefulWidget {
  const MyComplaint({Key? key}) : super(key: key);

  @override
  State<MyComplaint> createState() => _MyComplaintState();
}

class _MyComplaintState extends State<MyComplaint> {
  int index = 2;
  int? checkedIndex;

  @override
  void initState(){
    super.initState();
  }
  void refresh() {
    setState(() {});
  }

  void TabMove(int index) {
    switch(index) {
      case 0 :
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReservationPage())
        );
        break;
      case 1 :
        break;
      case 2 :
        refresh();
        break;
      case 3 :
        break;
    }
  }

  void TabIndex(int Tabindex) {
    setState(() {
      index = Tabindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    List<String> contents = [
      '질문과 답변', '고장 신고', '이용 신고', '분실 신고',
    ];

    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text("민원 등록"),
              ],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('민원 내용을 선택해주세요.'),
                      SizedBox(height: 25),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: contents.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(height: 40),
                      Text('상세 내용'),
                      SizedBox(height: 20),
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
                  SizedBox(height: 25),
                  ElevatedButton(
                    child: const Text('확인'),
                    style: ElevatedButton.styleFrom(
                      // foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      // backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      minimumSize: Size(150, 50),
                      textStyle: const TextStyle(fontSize: 18)
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],

              ),
            ),
          bottomNavigationBar:  BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (int index) {
              TabIndex(index);
              TabMove(index);
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.done),
                label: "예약",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "예약확인"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "민원"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "퇴실"
              ),
            ],
          ),
        ),
    );
  }
}
