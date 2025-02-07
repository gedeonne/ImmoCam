import 'package:flutter/material.dart';

class PropertyDetailPage extends StatefulWidget {
  @override
  _PropertyDetailPageState createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  int selectedImageIndex = 0;
  final List<String> imageList = List.generate(
      21, (index) => 'assets/images/${index % 3 + 1}.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainImage(),
            _buildImageThumbnails(),
            _buildPropertyDetails(),
            _buildPropertyInfo(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavbar(), // Sous-navbar ajoutée ici
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple, // Violet pour la barre d'applications
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white), // Icône en blanc
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.map, color: Colors.white), // Icône en blanc
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildMainImage() {
    return Stack(
      children: [
        Image.asset(imageList[selectedImageIndex],
            height: 250, width: double.infinity, fit: BoxFit.cover),
        Positioned(
          bottom: 10,
          right: 10,
          child: Row(
            children: [
              const Icon(Icons.camera_alt, color: Colors.white),
              const SizedBox(width: 5),
              Text("${imageList.length}",
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageThumbnails() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedImageIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(
                    color: selectedImageIndex == index
                        ? Colors.blue
                        : Colors.grey),
              ),
              child: Image.asset(imageList[index],
                  height: 60, width: 80, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPropertyDetails() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Achat Appartement 5 pièces, 120m²',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple)), // Titre en violet
          const Text('Superbe appartement en centre-ville',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          const SizedBox(height: 10),
          const Text('Prix: 50 000 000 FCFA',
              style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 10),
          _buildActionButtons(),
          const SizedBox(height: 20),
          _buildContactOptions(),
          const SizedBox(height: 20),
          const Text("Descriptif de l'appartement",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)), // Titre en violet
          const SizedBox(height: 10),
          const Text(
            "Cet appartement de 120m² est situé en plein centre-ville et offre un cadre de vie exceptionnel. Il dispose de 5 pièces spacieuses, d'une cuisine moderne et d'un grand balcon avec vue dégagée.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Honoraires: 5%', style: TextStyle(fontSize: 16)),
        TextButton(
          onPressed: () {},
          child: const Text('Voir la vidéo',
              style: TextStyle(fontSize: 16, color: Colors.purple)), // Texte en violet
        ),
      ],
    );
  }

  Widget _buildContactOptions() {
    return Row(
      children: [
        IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {}),
        IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.phone),
          label: const Text('Appeler'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        ),
      ],
    );
  }

  // Nouveau Widget pour afficher les cartes à propos de l'appartement
  Widget _buildPropertyInfo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "À propos de cet appartement de 5 pièces, 120m² à vendre",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Titre en violet
            ),
          ),
          const SizedBox(height: 10),
          // Utilisation de Row pour organiser les deux colonnes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Première colonne de cartes
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoCard('Prix et honoraires à la charge du vendeur'),
                    _buildInfoCard('120m²'),
                    _buildInfoCard('Terrasse'),
                    _buildInfoCard('Deux salles de bain'),
                    _buildInfoCard('WC séparés'),
                    _buildInfoCard('Magasin'),
                  ],
                ),
              ),
              SizedBox(width: 10),
              // Deuxième colonne de cartes
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoCard('Estimez votre mensualité',),
                    _buildInfoCard('4 pièces'),
                    _buildInfoCard('Sans travaux à prévoir'),
                    _buildInfoCard('Balcon de 10m²'),
                    _buildInfoCard('Salle d\'eau'),
                    _buildInfoCard('Fibre déployée'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, {bool isButton = false}) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black), // Titre en violet
        ),
        trailing: isButton
            ? TextButton(
          onPressed: () {},
          child: const Text(
            'Voir',
            style: TextStyle(color: Colors.purple), // Bouton violet
          ),
        )
            : null,
      ),
    );
  }

  // Sous-navbar en bas de l'écran
  Widget _buildBottomNavbar() {
    return BottomAppBar(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo "imocam" stylisé en violet
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                'imocam',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple, // Logo violet
                ),
              ),
            ),
            // Bouton "Contacter" avec icône de message
            IconButton(
              icon: const Icon(Icons.message, color: Colors.purple), // Icône violet
              onPressed: () {},
            ),
            // Bouton "Appeler" avec icône de téléphone
            IconButton(
              icon: const Icon(Icons.phone, color: Colors.purple), // Icône violet
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
