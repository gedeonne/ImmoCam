import 'package:flutter/material.dart';

import 'neumorphismTextField.dart';


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  String? name;
  String? password;
  String? email;
  bool canSubmit(){
    bool can = true;
    if(email == null) can = false;
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
        title:Text(
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments
            children: [
              // Titre de la page avec effet Neumorphism
              const SizedBox(height: 90),
              // Description explicative
              Text(
                'Veuillez entrer votre adresse amail pour verification',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 100),
              // Champ de texte pour le nouveau mot de passe
              NeumorphismTextfield(
                controller: emailController,
                hintext: 'Email',
                onChange: (value){
                  setState(() {
                    if(value  == ""){
                      email = null;
                    }else{
                      email = value;
                    }
                  });
                },
              ),
              const SizedBox(height: 15),
              // Champ de texte pour confirmer le mot de passes
              const SizedBox(height: 30),
              // Bouton pour changer le mot de passe
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: canSubmit()?  Color(0xFF6A1B9A) : Colors.grey,
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
                child: isLoading? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(strokeWidth: 4, color: Colors.white,)
                ): Text(
                  "soumetre",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:  canSubmit()? Colors.white: Colors.black,
                  ),
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }}
