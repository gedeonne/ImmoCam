import 'package:flutter/material.dart';
import 'package:immo/models/proprietes.dart';

class HomeDetails extends StatefulWidget {
  final Proprietes propriete;
  const HomeDetails({super.key, required this.propriete});

  @override
  State<HomeDetails> createState() => _HomedDetailsState();
}

class _HomedDetailsState extends State<HomeDetails> {
  String? imgp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.propriete.titre, overflow: TextOverflow.ellipsis, style: const TextStyle(fontFamily: "grandis", fontSize: 19),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.star_border_outlined))
        ],
      ),
      body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.blue,
                child: Hero(
                  tag: widget.propriete.imgspath.first,
                    child: Image.asset(imgp != null ? "assets/images/$imgp" : "assets/images/${widget.propriete.imgspath.first}", fit: BoxFit.cover,)),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.propriete.imgspath.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            imgp = widget.propriete.imgspath[index];
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: kElevationToShadow[2]
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Image.asset("assets/images/${widget.propriete.imgspath[index]}", fit: BoxFit.cover,),
                        ),
                      );
                    },
                ),
              ),
            ],
          )
      ),
    );
  }
}
