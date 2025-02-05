import 'package:flutter/material.dart';
import 'package:gs3/app/view/home/widgets/cartoes.dart';
import 'package:gs3/app/view/home/widgets/favoritos.dart';
import 'package:gs3/app/view/home/widgets/top_app_bar.dart';
import 'package:gs3/app/view/home/widgets/ultimos_lancamentos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              FadeTransition(
                opacity: _fadeAnimation,
                child: Cartoes()),
              const Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              SizedBox(
                height: 12,
              ),
              Favoritos(),
              const Divider(),
              const SizedBox(
                height: 12,
              ),
              UltimosLancamentos(),
            ],
          ),
        ),
      ),
    );
  }
}
