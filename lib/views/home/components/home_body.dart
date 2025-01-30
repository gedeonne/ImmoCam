import 'package:flutter/material.dart';
import 'package:immo/models/proprietes.dart';

import 'filtercard.dart';
import 'homecard.dart';

class HomeBody extends StatelessWidget {
   HomeBody({super.key});

  final List<String> filter = [
    "Tout",
    "A Louer",
    "vendre"
  ];

   List<Proprietes> proprietes = [
     Proprietes(1, titre: "Villa Moderne", description: "Belle villa avec piscine et jardin.", imgspath: ["img1.jpg", "img2.jpg"], proprietaireId: 101, prix: 250000.0),
     Proprietes(2, titre: "Appartement Luxueux", description: "Appartement meublé avec vue sur mer.", imgspath: ["img3.jpg", "img1.jpg"], proprietaireId: 102, prix: 150000.0),
     Proprietes(3, titre: "Studio Confortable", description: "Studio bien situé, proche du centre-ville.", imgspath: ["img2.jpg", "img2.jpg"], proprietaireId: 103, prix: 75000.0),
     Proprietes(4, titre: "Maison de Campagne", description: "Maison spacieuse avec grand terrain.", imgspath: ["img3.jpg", "img1.jpg"], proprietaireId: 104, prix: 180000.0),
     Proprietes(5, titre: "Loft Industriel", description: "Loft moderne avec design unique.", imgspath: ["img2.jpg", "img3.jpg"], proprietaireId: 105, prix: 200000.0),
     Proprietes(6, titre: "Duplex Moderne", description: "Duplex entièrement rénové.", imgspath: ["img1.jpg", "img2.jpg"], proprietaireId: 106, prix: 220000.0),
     Proprietes(7, titre: "Penthouse Vue Panoramique", description: "Penthouse avec vue imprenable sur la ville.", imgspath: ["img3.jpg", "img1.jpg"], proprietaireId: 107, prix: 500000.0),
     Proprietes(8, titre: "Maison Traditionnelle", description: "Maison au style traditionnel avec patio.", imgspath: ["img2.jpg", "img3.jpg"], proprietaireId: 108, prix: 120000.0),
     Proprietes(9, titre: "Chalet en Montagne", description: "Chalet rustique en pleine nature.", imgspath: ["img1.jpg", "img2.jpg"], proprietaireId: 109, prix: 175000.0),
     Proprietes(10, titre: "Résidence Étudiante", description: "Petite résidence idéale pour étudiants.", imgspath: ["img3.jpg", "img1.jpg"], proprietaireId: 110, prix: 85000.0),
     Proprietes(11, titre: "Studio en Centre-Ville", description: "Studio proche des commerces et transports.", imgspath: ["img1.jpg", "img2.jpg"], proprietaireId: 111, prix: 65000.0),
     Proprietes(12, titre: "Ferme Écologique", description: "Ferme autonome avec panneaux solaires.", imgspath: ["img3.jpg", "img1.jpg"], proprietaireId: 112, prix: 300000.0),
     Proprietes(13, titre: "Manoir Historique", description: "Manoir datant du XIXe siècle.", imgspath: ["img2.jpg", "img3.jpg"], proprietaireId: 113, prix: 800000.0),
     Proprietes(14, titre: "Bungalow Plage", description: "Bungalow pieds dans l'eau.", imgspath: ["img1.jpg", "img2.jpg"], proprietaireId: 114, prix: 275000.0),
     Proprietes(15, titre: "Maison Familiale", description: "Maison spacieuse avec 4 chambres.", imgspath: ["img3.jpg", "img1.jpg"], proprietaireId: 115, prix: 195000.0),
     Proprietes(16, titre: "Cabane en Forêt", description: "Cabane écologique en bois.", imgspath: ["img3.jpg", "img2.jpg"], proprietaireId: 116, prix: 95000.0),
     Proprietes(17, titre: "Riad Marocain", description: "Riad traditionnel avec cour intérieure.", imgspath: ["img3.jpg", "img2.jpg"], proprietaireId: 117, prix: 250000.0),
     Proprietes(18, titre: "Château Médiéval", description: "Château avec tours et douves.", imgspath: ["img3.jpg", "img2.jpg"], proprietaireId: 118, prix: 1000000.0),
     Proprietes(19, titre: "Appartement Minimaliste", description: "Petit appartement moderne et fonctionnel.", imgspath: ["img1.jpg", "img2.jpg"], proprietaireId: 119, prix: 99000.0),
     Proprietes(20, titre: "Maison de Ville", description: "Maison en plein cœur de la ville.", imgspath: ["img3.jpg", "img1.jpg"], proprietaireId: 120, prix: 210000.0),
   ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12,),
        SizedBox(
          height: 35,
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) => Filterelement(label: filter[index]),
          ),
        ),
        const SizedBox(height: 12,),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: proprietes.length,
              itemBuilder: (context, index) {
                return Homecard(proprietes: proprietes[index]);
              },
          ),
        )
      ],
    );
  }
}
