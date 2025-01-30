import 'package:flutter/material.dart';
import 'package:immo/views/authviews/componentsauth/neumorphismTextField.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? name;
  String? password;
  bool isLoading = false;

  bool canSubmit(){
    bool can = true;
    if(name == null || password == null) can = false;
    return can;
  }

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Animation Tween
    _animation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7EBF0), // Fond bleu-gris clair
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titre animé
              ScaleTransition(
                scale: _animation,
                child: const Text(
                  "Bienvenue sur ImoCam",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A1B9A), // Violet profond
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Sous-titre
              const Text(
                "Votre application immobilière adaptée à vos besoins.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              // Photo de profil avec Neumorphism et icône
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7EBF0), // Fond Neumorphism
                      shape: BoxShape.circle,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, -5),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: const Offset(5, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFF6A1B9A), // Violet
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 30),
              // Champ nom
              NeumorphismTextfield(
                controller: nameController,
                prefixIcon: Icon(Icons.person, color: Colors.grey,),
                hintext: 'Nom',
                onChange: (value){
                  setState(() {
                    if(value == ""){
                      name = null;
                    }else{
                      name = value;
                    }
                  });
                },
              ),
              const SizedBox(height: 30),
              // Champ mot de passe
              NeumorphismTextfield(
                controller: passwordController,
                prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                hintext: 'Mot de passe',
                isPassword: true,
                onChange: (value){
                  setState(() {
                    if(value == ""){
                      password = null;
                    }else{
                      password = value;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              // "Mot de passe oub?"
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Action pour mot de passe oublié
                      Navigator.pushNamed(context, '/changemotdepass');
                    },
                    child: const Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(
                        color: Color(0xFF6A1B9A), // Violet
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Bouton Valider
              GestureDetector(
                onTap: () {
                  // Action pour la connexion
                  if(canSubmit()){
                    setState(() {
                      isLoading = !isLoading;
                    });
                    Future.delayed(
                      Duration(seconds: 3),
                        (){
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
                    "Valider",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:  canSubmit()? Colors.white: Colors.black,
                    ),
                  ) ,
                ),
              ),
              const SizedBox(height: 20),
              // "Créez un compte"
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup'); //naviagtion vers l’écran signup
                },
                child: const Text(
                  "Créez un compte",
                  style: TextStyle(
                    color: Color(0xFF6A1B9A), // Violet
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour les champs de texte avec Neumorphism
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7EBF0), // Fond Neumorphism
        borderRadius: BorderRadius.circular(15),
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
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
