import 'package:flutter/material.dart';

import 'neumorphismTextField.dart';


class ChangePasswordPage extends StatefulWidget {
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController emailController = TextEditingController();

  String? email;

  bool isLoading = false;

  bool canSubmit() {
    bool can = true;
    if (email == null) can = false;
    return can;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.purple.shade700),
        ),
        title: Text(
          'imocam',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade700,
          ),
        ),
        centerTitle: true,

      ), // Barre d'applications avec style Neumorphism
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                  ],
                ),
          
              ),
              SizedBox(height: 10),
              // Description explicative
              Text(
                'Veuillez entrer votre adresse email pour verification.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              SizedBox(height: 100),
              // Champ de texte pour le nouveau mot de passe
              NeumorphismTextfield(
                controller: emailController,
                hintext: 'Entrez votre email',
                onChange: (value) {
                  setState(() {
                    if (value == ""){
                      email = null;
                    }else{
                      email = value;
                    }
          
                  });
                },
              ),
          
              const SizedBox(height: 30),
              // Bouton Valider
              GestureDetector(
                onTap: () {
                  // Action pour la connexion
                  if (canSubmit()) {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    Future.delayed(
                        Duration(seconds: 3),
                            () {
                          setState(() {
                            isLoading = !isLoading;
                          });
                        }
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: canSubmit() ? Color(0xFF6A1B9A) : Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(3, 3),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: isLoading ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 4, color: Colors.white,)
                  ) : Text(
                    "Soumettre",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: canSubmit() ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

}