import 'package:flutter/material.dart';

import 'components/appbar.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                icon: Icon(Icons.person),
                label: "Account"
            ),
          ]
      ),
    );
  }
}
