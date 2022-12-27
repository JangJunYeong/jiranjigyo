import 'package:flutter/material.dart';
import 'package:jiranjigyo/confirm.dart';
import 'package:jiranjigyo/theme.dart';
import 'homepage.dart';
import 'login.dart';
import 'reservation.dart';
import 'complaint.dart';
import 'confirm.dart';
import 'leave.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => const MyHomePage(),
          '/login': (BuildContext context) => const LoginPage(),
          '/reservation': (BuildContext context) => const ReservationPage(),
          '/complaint': (BuildContext context) => const MyComplaint(),
          '/confirm': (BuildContext context) => const ConfirmPage(),
          '/leave': (BuildContext context) => const LeavePage(),
        }
    );
  }
}