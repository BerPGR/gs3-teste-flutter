import 'package:flutter/material.dart';
import 'package:gs3/app/screens_container.dart';
import 'package:gs3/app/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gs3/app/view/notfound/not_found_screen.dart';
import 'package:gs3/app/view/posting/posting_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: MaterialApp(
        title: "GS3 Teste Técnico",
        initialRoute: "/",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/":
              return MaterialPageRoute(builder: (context) => ScreensContainer());
            case "/posting":
              return MaterialPageRoute(builder: (context) => PostingScreen(), settings: settings);
            default:
              return MaterialPageRoute(builder: (context) => NotFoundScreen());
          }
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Mulish",
          brightness: Brightness.light,
        ),
      ),
    );
  }
}