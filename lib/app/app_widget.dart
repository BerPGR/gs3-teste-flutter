import 'package:flutter/material.dart';
import 'package:gs3/app/screens_container.dart';
import 'package:gs3/app/view/not_found_screen.dart';
import 'package:gs3/app/view/posting_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GS3 Teste Técnico",
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (context) => ScreensContainer());
          case "/posting":
            return MaterialPageRoute(builder: (context) => PostingScreen());
          default:
            return MaterialPageRoute(builder: (context) => NotFoundScreen());
        }
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Mulish",
        brightness: Brightness.light,
      ),
    );
  }
}