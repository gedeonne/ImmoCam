import 'package:flutter/material.dart';

import '../../../models/proprietes.dart';
import '../../homedetail/homedetails.dart';

class Homecard extends StatefulWidget {
  const Homecard({
    super.key,
    required this.proprietes,
  });

  final Proprietes proprietes;

  @override
  State<Homecard> createState() => _HomecardState();
}

class _HomecardState extends State<Homecard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetails(propriete: widget.proprietes,),));
      },
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[2]
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Hero(
                            tag: widget.proprietes.imgspath.first,
                              child: Image.asset("assets/images/${widget.proprietes.imgspath.first}", fit: BoxFit.cover,))),
                      Positioned(
                        right: 0,
                        child: IconButton(onPressed: (){
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                            icon: Icon(isLiked ? Icons.star : Icons.star_border_outlined, color: isLiked ? Colors.red : Colors.white,)),
                      )
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.proprietes.titre,overflow: TextOverflow.ellipsis ,style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: "petit"),),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(widget.proprietes.description,overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
