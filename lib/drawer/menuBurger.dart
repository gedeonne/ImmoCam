import 'package:flutter/material.dart';

class Menuburger extends StatefulWidget {
  final String pageName;

  const Menuburger({super.key, required this.pageName});

  @override
  State<Menuburger> createState() => _MenuburgerState();
}

class _MenuburgerState extends State<Menuburger> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
              title: Text('Accueil'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                if(widget.pageName == "Accueil"){
                  print("aucune action");
                }else{
                  print("aller a la page indique");
                }
              }
          ),
          ListTile(
              title: Text('Nouvelle Recherche'),
              leading: Icon(Icons.search),
              onTap: () {
                Navigator.of(context).pop();
                if(widget.pageName == "Nouvelle Recherche"){
                  print("aucune action");
                }else{
                  print("aller a la page indique");
                }
              }
          ),
          ListTile(
              title: Text('Mes Favoris'),
              leading: Icon(Icons.favorite),
              onTap: () {
                Navigator.of(context).pop();
                if(widget.pageName == "Mes Favoris"){
                  print("aucune action");
                }else{
                  print("aller a la page indique");
                }
              }
          ),
          ListTile(
              title: Text('Mes Alertes'),
              leading: Icon(Icons.notifications),
              onTap: () {
                Navigator.of(context).pop();
                if(widget.pageName == "Mes Alertes"){
                  print("aucune action");
                }else{
                  print("aller a la page indique");
                }
              }
          ),
          ListTile(
              title: Text('Se connecter'),
              leading: Icon(Icons.login),
              onTap: () {
                Navigator.of(context).pop();
                if(widget.pageName == "Se connecter"){
                  print("aucune action");
                }else{
                  print("aller a la page indique");
                }
              }
          ),
        ],
      ),
    );
  }
}

