import 'package:flutter/material.dart';
import 'package:gs3/app/view/home/home_screen.dart';

class ScreensContainer extends StatefulWidget {
  const ScreensContainer({super.key});

  @override
  State<ScreensContainer> createState() => _ScreensContainerState();
}

class _ScreensContainerState extends State<ScreensContainer> {
  int _selectedIndex = 0;

  final List<Widget> _appScreens = [
    HomeScreen(),
    FaturaScreen(),
    CartaoScreen(),
    ShopScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _appScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade100,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined),
            label: 'Fatura',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            label: 'Cartão',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xffB4B4B8),
        unselectedLabelStyle: TextStyle(fontSize: 9, color: Color(0xffB4B4B8)),
        selectedItemColor: Color(0xFF3C6AB2),
        selectedLabelStyle: TextStyle(fontSize: 12, color: Color(0xFF3C6AB2)),
        onTap: _onItemTapped,
      ),
    );
  }
}

class FaturaScreen extends StatelessWidget {
  const FaturaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("A página de Fatura não existe"),
    );
  }
}

class CartaoScreen extends StatelessWidget {
  const CartaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("A página de Cartão não existe"),
    );
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("A página de Shop não existe"),
    );
  }
}
