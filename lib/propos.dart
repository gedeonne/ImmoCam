import 'package:flutter/material.dart';

class ApartmentDetails extends StatelessWidget {
  final List<Map<String, dynamic>> details = [
  {'icon': Icons.price_change, 'text': '50 000 000 FCFA, Honoraires vendeur'},
  {'icon': Icons.square_foot, 'text': '120 m²'},
  {'icon': Icons.umbrella, 'text': 'Terrasse'},
  {'icon': Icons.bathtub, 'text': '2 Salles de bain'},
  {'icon': Icons.wc, 'text': 'WC séparés'},
  {'icon': Icons.store, 'text': 'Un magasin'},
  {'icon': Icons.calculate, 'text': 'Estimez votre mensualité'},
  {'icon': Icons.meeting_room, 'text': '4 pièces'},
  {'icon': Icons.build, 'text': 'Sans travaux à prévoir'},
  {'icon': Icons.balcony, 'text': 'Balcon 10m²'},
  {'icon': Icons.shower, 'text': "1 Salle d'eau"},
  {'icon': Icons.wifi, 'text': 'Fibre déployée'},
];

  @override
  Widget build(BuildContext context) {
      return Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'À propos de cet appartement',
style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
),
SizedBox(height: 10),
Text('Appartement 5 pièces, 120 m² à vendre',
style: TextStyle(fontSize: 16, color: Colors.grey)),
SizedBox(height: 20),
GridView.builder(
shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
childAspectRatio: 3,
crossAxisSpacing: 10,
mainAxisSpacing: 10,
),
itemCount: details.length,
itemBuilder: (context, index) {
return Card(
elevation: 3,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
child: Padding(
padding: const EdgeInsets.all(12.0),
child: Row(
children: [
Icon(details[index]['icon'], color: Colors.blue),
SizedBox(width: 10),
Expanded(
child: Text(
details[index]['text'],
style: TextStyle(fontSize: 14),
overflow: TextOverflow.ellipsis,
),
),
],
),
),
);
},
),
],
),
);
}
}
