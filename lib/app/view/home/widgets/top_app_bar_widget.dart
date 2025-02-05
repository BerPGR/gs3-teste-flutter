import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 32,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "Olá, ",
                  style: TextStyle(fontSize: 20),
                  children: [
                    TextSpan(
                        text: "Cliente",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ])),
          Row(
            spacing: 8,
            children: [
              Icon(
                Icons.messenger_outline_rounded,
                color: Colors.white,
              ),
              Badge(
                isLabelVisible: true,
                label: const Text("3"),
                backgroundColor: Color(0xff2890CF),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
