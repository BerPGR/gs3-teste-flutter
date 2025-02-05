import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Favoritos extends StatelessWidget {
  final List<Map<String, dynamic>> favoritos = [
    {'title': 'Cartão virtual', 'image': 'assets/images/gym.svg'},
    {'title': 'Cartão adicional', 'image': 'assets/images/gym-1.svg'},
    {
      'title': 'Seguros',
      'image': 'assets/images/mingcute_safe-shield-2-fill.svg'
    },
    {'title': 'Pacote SMS', 'image': 'assets/images/mail.svg'},
  ];
  Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Meus favoritos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 4,
              children: [
                Text(
                  "Personalizar",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  "assets/images/Grid Four 2.svg",
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final favorito = favoritos[index];
                return Container(
                  padding: const EdgeInsets.only(top: 20),
                  margin: const EdgeInsets.only(right: 32),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        favorito['image'],
                        height: 32,
                      ),
                      SizedBox(
                          width: 70,
                          child: Text(
                            favorito['title'],
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(fontSize: 12),
                          ))
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
