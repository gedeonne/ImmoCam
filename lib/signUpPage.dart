import 'package:flutter/material.dart';
import 'package:immo/neumorphismTextField.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Color baseColor = Color(0xFFE0E5EC); // Neumorphic background color
  final Color highlightColor = Colors.white; // Light shadow color
  final Color shadowColor = Color(0xFFB3B7C0); // Dark shadow color
  final List<String> genders = ['Homme', 'Femme'];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedGender;
  FocusNode? activeField;
  String? name;
  String? email;
  String? password;
  String? phone;
  bool isLoading = false;
  bool canSubmit(){
    bool can = true;
    if(name == null || email == null || password == null || phone == null || selectedGender == null) can = false;
    return can;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo ImmoCam
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
              child: Text(
                "ImoCam",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  shadows: [
                    Shadow(
                      color: shadowColor,
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    ),
                    Shadow(
                      color: highlightColor,
                      offset: Offset(-2, -2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
            // Photo de profil avec icône
            Center(
              child: GestureDetector(
                onTap: () {
                  // Ajouter une logique pour sélectionner une image
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: baseColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: highlightColor,
                        offset: Offset(-5, -5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.person, size: 50, color: Colors.grey),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurple,
                            boxShadow: [
                              BoxShadow(
                                color: shadowColor,
                                offset: Offset(3, 3),
                                blurRadius: 7,
                              ),
                              BoxShadow(
                                color: highlightColor,
                                offset: Offset(-3, -3),
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: Icon(Icons.add_a_photo, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 70),
            // Champs de texte
            NeumorphismTextfield(
              controller: nameController,
              hintext: 'Nom complet',
              onChange: (value){
                setState(() {
                  if (value == ""){
                    name = null;
                  }else{
                    name = value;
                  }
                });
              },
            ),
            SizedBox(height: 30),
            NeumorphismTextfield(
                controller: emailController,
                hintext: 'Email',
                onChange: (value){
                  setState(() {
                    if (value == ""){
                      email = null;
                    }else{
                      email = value;
                    }
                  });
                },
            ),
            SizedBox(height: 30),
            NeumorphismTextfield(
              controller: passwordController,
              hintext: 'Mot de passe',
              isPassword: true,
              onChange: (value){
                setState(() {
                  if (value == ""){
                    password = null;
                  }else{
                    password = value;
                  }
                });
              },
            ),
            SizedBox(height: 30),
            // Genre sélectionnable
            _buildNeumorphicDropdown('Genre', genders, (value) {
              setState(() {
                selectedGender = value;
              });
            }, selectedGender),
            SizedBox(height: 30),
            NeumorphismTextfield(
              controller: phoneController,
              hintext: 'Numéro de téléphone',
              onChange: (value){
                setState(() {
                  if (value == ""){
                    phone = null;
                  }else{
                    phone = value;
                  }
                });
              },
            ),
            SizedBox(height: 30),
            // Bouton S'inscrire
            GestureDetector(
              onTap: () {
                // Logique d'inscription
              },
              child: Container(
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                  gradient: canSubmit()? LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent]) : null,
                  color: canSubmit()? null : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      offset: Offset(4, 4),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: highlightColor,
                      offset: Offset(-4, -4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(color: canSubmit()? Colors.white: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Phrase de connexion
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Avez-vous déjà un compte? ",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Logique pour rediriger vers la connexion
                    Navigator.pop(context);

                  },
                  child: Text(
                    "Connectez-vous!",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

  Widget _buildNeumorphicTextField(String hintText, {bool isPassword = false}) {
    final focusNode = FocusNode();
    bool obscured = false;
    focusNode.addListener(() {
      setState(() {
        activeField = focusNode.hasFocus ? focusNode : null;
      });
    });

    bool isActive = activeField == focusNode;

    return Container(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isActive
            ? [
          BoxShadow(
            color: shadowColor.withOpacity(0.4),
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: highlightColor.withOpacity(0.6),
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ]
            : [
          BoxShadow(
            color: shadowColor,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: highlightColor,
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        focusNode: focusNode,
        obscureText: obscured,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: isPassword? IconButton(
              onPressed: (){
                setState(() {
                  obscured = !obscured;
                });
              },
              icon: Icon( obscured? Icons.visibility : Icons.visibility_off)
          ) : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildNeumorphicDropdown(String label, List<String> items, ValueChanged<String?> onChanged, String? value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: highlightColor,
            offset: Offset(-5, -5),
            blurRadius: 10,
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: SizedBox(),
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        hint: Text(label),
      ),
    );
  }
}
