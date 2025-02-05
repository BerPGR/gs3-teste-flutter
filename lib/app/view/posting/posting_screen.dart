import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gs3/app/shared/utils/data_parser.dart';
import 'package:gs3/app/shared/utils/number_parser.dart';
import 'package:gs3/app/shared/utils/show_bottom_dialog.dart';
import 'package:gs3/app/shared/widget/cartao_widget.dart';

class PostingScreen extends StatefulWidget {
  const PostingScreen({super.key});

  @override
  State<PostingScreen> createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen>
    with SingleTickerProviderStateMixin {
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
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final cartao = args?['cartao'];
    final postings = args?['lancamentos'];

    final Map<String, List<dynamic>> groupedPostings = {};
    for (var posting in postings) {
      String mesAno = formatarMesAno(posting.date);
      if (!groupedPostings.containsKey(mesAno)) {
        groupedPostings[mesAno] = [];
      }
      groupedPostings[mesAno]!.add(posting);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3C6AB2),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF3C6AB2),
          Colors.white,
          Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(children: [
            Cartao(cartao: cartao),
            Expanded(
              child: ListView(
                children: groupedPostings.entries.map((entry) {
                  String mesAno = entry.key;
                  List<dynamic> lancamentos = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child: Text(
                          mesAno,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2890CF),
                          ),
                        ),
                      ),
                      ...lancamentos.map((posting) {
                        return ListTile(
                          onTap: () =>
                              mostrarDetalhesLancamento(context, posting),
                          leading: SvgPicture.asset(posting.image, width: 30),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "R\$${formatarValor(posting.value)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(posting.installments == 0
                                  ? ""
                                  : "em ${posting.installments}x")
                            ],
                          ),
                          title: Text(
                            posting.description,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            formatarSubtitulo(posting.date),
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
