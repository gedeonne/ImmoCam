import 'package:flutter/material.dart';


class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      appBar: NeumorphicAppBar(), // Barre d'applications avec style Neumorphism
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments
          children: [
            // Titre de la page avec effet Neumorphism
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(4, 4), // Ombre extérieure
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(-4, -4), // Ombre intérieure
                  ),
                ],
              ),
              child: Text(
                'Réinitialisation du mot de passe',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade700,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Description explicative
            Text(
              'Veuillez entrer un nouveau mot de passe sécurisé et le confirmer.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(height: 20),
            // Champ de texte pour le nouveau mot de passe
            _buildNeumorphicTextField('Nouveau mot de passe'),
            SizedBox(height: 15),
            // Champ de texte pour confirmer le mot de passe
            _buildNeumorphicTextField('Confirmer le mot de passe'),
            SizedBox(height: 30),
            // Bouton pour changer le mot de passe
            _buildNeumorphicButton(context),
          ],
        ),
      ),
    );
  }

  // Fonction pour construire un champ de texte avec style Neumorphism
  Widget _buildNeumorphicTextField(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(4, 4), // Ombre extérieure
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(-4, -4), // Ombre intérieure
          ),
        ],
      ),
      child: TextField(
        obscureText: true, // Cache le texte du mot de passe
        decoration: InputDecoration(
          border: InputBorder.none, // Pas de bordure
          hintText: hint, // Texte d'exemple (ex : "Nouveau mot de passe")
          hintStyle: TextStyle(color: Colors.grey.shade600), // Couleur du texte d'exemple
        ),
      ),
    );
  }

  // Fonction pour créer un bouton avec un effet Neumorphism
  Widget _buildNeumorphicButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Logique pour changer le mot de passe (à implémenter)
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(4, 4), // Ombre extérieure
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(-4, -4), // Ombre intérieure
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Changer le mot de passe',
            style: TextStyle(
              fontSize: 18,
              color: Colors.purple.shade700, // Couleur violette
              fontWeight: FontWeight.bold, // Gras
            ),
          ),
        ),
      ),
    );
  }
}

// Classe pour la barre d'applications avec le logo 'imocam'
class NeumorphicAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espace entre les éléments
        children: [
          // Bouton retour avec effet Neumorphism
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), // Utilisation de borderRadius pour la forme circulaire
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(4, 4), // Ombre extérieure
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(-4, -4), // Ombre intérieure
                  ),
                ],
              ),
              child: Icon(Icons.arrow_back, color: Colors.purple.shade700),
            ),
          ),
          // Texte "imocam" avec style Neumorphism
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(4, 4), // Ombre extérieure
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-4, -4), // Ombre intérieure
                ),
              ],
            ),
            child: Text(
              'imocam',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
          ),
          SizedBox(width: 48), // Espacement à droite
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
