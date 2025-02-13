import 'package:flutter/material.dart';

class BienImmobilierCard extends StatefulWidget {
  final String image;
  final int photo;
  final String title;
  final String price;
  final bool isExclusive;

  const BienImmobilierCard({super.key, required this.image, required this.photo, required this.title, required this.price, required this.isExclusive});

  @override
  State<BienImmobilierCard> createState() => _BienImmobilierCardState();
}

class _BienImmobilierCardState extends State<BienImmobilierCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/detailpage');
                    },
                    child: Image.asset(widget.image, height: 200, width: double.infinity, fit: BoxFit.cover),
                  ),
                  // Affichage de "Annonce à la une" sur les deux premières images
                  if (widget.image == 'assets/images/1.jpg' || widget.image == 'assets/images/2.jpg')
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        color: Colors.purple,  // Violet pour la couleur
                        child: Text('Annonce à la une', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt, color: Colors.white),
                        SizedBox(width: 5),
                        Text('${widget.photo}', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)), // Violet pour le titre
                    Text(widget.price, style: TextStyle(fontSize: 16, color: Colors.green)),
                  ],
                ),
              ),
            ],
          ),
          if (widget.isExclusive)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.red,
                child: Text('Exclusivité', style: TextStyle(color: Colors.white)),
              ),
            ),
          // Positionner l'icône "favorite" en bas au niveau du titre
          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.purple),  // Icône favorite en violet
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
