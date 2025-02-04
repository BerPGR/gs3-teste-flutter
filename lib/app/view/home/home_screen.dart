import 'package:flutter/material.dart';
import 'package:gs3/app/view/home/widgets/cartoes.dart';
import 'package:gs3/app/view/home/widgets/favoritos.dart';
import 'package:gs3/app/view/home/widgets/top_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF3C6AB2),
          Colors.white,
          Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Column(
            spacing: 4,
            children: [
              TopAppBar(),
              const Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              Cartoes(),
              const Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              SizedBox(
                height: 38,
              ),
              Favoritos()
            ],
          ),
        ),
      ),
    );
  }
}
