import 'package:flutter/material.dart';

import 'components/appbar.dart';
import 'components/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              children: [
                const AppBarCustom(),
                const Divider(),
                Expanded(child: HomeBody())
              ],
            )
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
              label: "favorite"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
              label: "Mes Achats"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account"
            ),
          ]
      ),
    );
  }
}
