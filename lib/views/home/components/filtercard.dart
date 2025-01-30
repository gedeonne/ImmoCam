import 'package:flutter/material.dart';

class Filterelement extends StatefulWidget {
  final String label;
  const Filterelement({
    super.key,required this.label,
  });

  @override
  State<Filterelement> createState() => _FilterelementState();
}

class _FilterelementState extends State<Filterelement> {
  Color couleur = Colors.white;
  String ele = "";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(ele == widget.label){
          setState(() {
            ele = "";
          });
        }else{
          setState(() {
            ele = widget.label;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ele == widget.label ? Colors.grey : Colors.pink,
            borderRadius: BorderRadius.circular(5)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Text(widget.label, style: const TextStyle(fontFamily: "petit",fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(width: 7,),
            if(ele == widget.label)...[
              const Icon(Icons.close, color: Colors.white,size: 16,)
            ]
          ],
        ),
      ),
    );
  }
}