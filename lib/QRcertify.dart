import 'package:flutter/material.dart';
import './widget/appbar.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';

class QRcertifyPage extends StatefulWidget {
  const QRcertifyPage({Key? key}) : super(key: key);

  @override
  State<QRcertifyPage> createState() => _QRcertifyPageState();
}

class _QRcertifyPageState extends State<QRcertifyPage> {
  // int index = 3;
  // int? checkedIndex;
  String _output = 'QR 코드를 스캔해주십시오';

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
      appBar: AppBarWidget(AppBar(), "QR인증"),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            //정 가운데에 QR 스켄값 표시
            child: Text(_output, style: TextStyle(color: Colors.black)),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scan(),
        tooltip: 'scan',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  Future _scan() async {
    //스캔 시작 - 이때 스캔 될때까지 blocking
    String? barcode = await scanner.scan();
    //스캔 완료하면 _output 에 문자열 저장하면서 상태 변경 요청.
    setState(() => _output = barcode ?? 'QR 코드를 스캔해주십시오');
  }
}

