import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();
getImage() async {
  final XFile? picked = await _picker.pickImage(
    source: ImageSource.gallery,
    requestFullMetadata: false, //<--- true 적용시 png 파일 투명 배경 사라짐
  );
}

class CameraExample extends StatefulWidget {
  const CameraExample({Key? key}) : super(key: key);

  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  File? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        backgroundColor: const Color(0xfff4f3f9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 25.0),
            showImage(),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // 카메라 촬영 버튼
                FloatingActionButton(
                  child: Icon(Icons.add_a_photo),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                ),

                // 갤러리에서 이미지를 가져오는 버튼
                FloatingActionButton(
                  child: Icon(Icons.wallpaper),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
                  elevation: 6,
                  shadowColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  minimumSize: const Size(400, 60),
                  textStyle: const TextStyle(fontSize: 25)),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Icon(Icons.check),
                      content: const Text(
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          '제출이 완료되었습니다.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text(
                              style: TextStyle(color: Colors.black), 'OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('제출하기', style: TextStyle(color: Colors.black)),
            ),
          ],
        ));
  }
}
