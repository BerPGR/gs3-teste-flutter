import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gs3/app/shared/utils/data_parser.dart';
import 'package:gs3/app/shared/utils/number_parser.dart';
import 'package:gs3/app/shared/utils/show_bottom_dialog.dart';
import 'package:gs3/app/shared/widget/cartao.dart';

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
    final lancamentos = args?['lancamentos'];

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
              child: ListView.builder(
                itemCount: lancamentos.length,
                itemBuilder: (context, index) {
                  final lancamento = lancamentos[index];
                  return ListTile(
                    onTap: () => mostrarDetalhesLancamento(context, lancamento),
                    leading: SvgPicture.asset(lancamento.imagem, width: 30),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "R\$${formatarValor(lancamento.valor)}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text("")
                      ],
                    ),
                    title: Text(
                      lancamento.descricao,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      formatarSubtitulo(lancamento.data),
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
