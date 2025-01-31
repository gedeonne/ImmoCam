import 'package:flutter/material.dart';

import 'Cart.dart';
import 'menuBurger.dart';


class RealEstatePage extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [
    {
      'images': ['assets/images/1.jpg', 'assets/images/2.jpg'],
      'title': 'Appartement 3 pièces, 80m²',
      'price': '15 000 000 FCFA',
      'photos': 10,
      'isExclusive': true,
    },
    {
      'images': ['assets/images/3.jpg', 'assets/images/4.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/5.jpg', 'assets/images/6.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/7.jpg', 'assets/images/8.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/9.jpg', 'assets/images/10.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/8.jpg', 'assets/images/8.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/4.jpg', 'assets/images/3.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/10.jpg', 'assets/images/11.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/11.jpg', 'assets/images/12.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/12.jpg', 'assets/images/13.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/13.jpg', 'assets/images/14.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/14.jpg', 'assets/images/15.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/15.jpg', 'assets/images/16.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/16.jpg', 'assets/images/17.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/17.jpg', 'assets/images/18.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
    {
      'images': ['assets/images/18.jpg', 'assets/images/19.jpg'],
      'title': 'Villa 5 pièces, 150m²',
      'price': '30 000 000 FCFA',
      'photos': 8,
      'isExclusive': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biens Immobiliers'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.map), onPressed: () {}),
        ],
      ),
      drawer: Menuburger(
        pageName: "Accueil",
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return BienImmobilierCard(
            image: property['images'][0],
            photo: property['photos'],
            title: property['title'],
            price: property['price'],
            isExclusive: property['isExclusive'],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            Text('Page 1 de 7'),
            IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
