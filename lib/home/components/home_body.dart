import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
   HomeBody({super.key});

  final List<Map<String, dynamic>> filter = [
    {
      "icon":Icons.monetization_on_outlined,
      'label':"A vendre"
    },
    {
      "icon":Icons.bedroom_parent_outlined,
      'label':"A louer"
    },
    {
      "icon":Icons.monetization_on_outlined,
      'label':"A vendre"
    },
    {
      "icon":Icons.bedroom_parent_outlined,
      'label':"A louer"
    },
    {
      "icon":Icons.monetization_on_outlined,
      'label':"A vendre"
    },
    {
      "icon":Icons.bedroom_parent_outlined,
      'label':"A louer"
    },
    {
      "icon":Icons.monetization_on_outlined,
      'label':"A vendre"
    },
    {
      "icon":Icons.bedroom_parent_outlined,
      'label':"A louer"
    },
    {
      "icon":Icons.monetization_on_outlined,
      'label':"A vendre"
    },
    {
      "icon":Icons.bedroom_parent_outlined,
      'label':"A louer"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12,),
        SizedBox(
          height: 35,
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: filter.length,
              itemBuilder: (context, index) => Filterelement(label: filter[index]['label']),
          ),
        ),
        const SizedBox(height: 12,),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
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
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                              child: Image.asset("assets/images/img3.jpg", fit: BoxFit.cover,))),
                      const Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Maison Moderne", style: TextStyle(fontWeight: FontWeight.bold),),
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("A vendre"),
                                    Text("25000 Xaf"),
                                  ],
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                );
              },
          ),
        )
      ],
    );
  }
}

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
            Text(widget.label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
