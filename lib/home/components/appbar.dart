import 'package:flutter/material.dart';

import 'subcomponents/appbaricons.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            alignment: Alignment.center,
            height: 42,
            width: isOpened ? 42 : 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: kElevationToShadow[2]
            ),
            duration: const Duration(milliseconds: 500),
            child: isOpened ? const Icon(Icons.home, color: Colors.blue,)
                :
            const Text("IMMO",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: isOpened ? MediaQuery.of(context).size.width * .6 : 42,
                height: 42,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: kElevationToShadow[2]
                ),
                child: isOpened ? Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: TextField(
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.blue),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 10),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              isOpened = !isOpened;
                            });
                          },
                          child: const Icon(Icons.close, color: Colors.blue,)),
                    )
                  ],
                ) : InkWell(
                    onTap: () {
                      setState(() {
                        isOpened = !isOpened;
                      });
                    },
                    child: const Icon(Icons.search_rounded, color: Colors.blue,)),
              ),
              const SizedBox(width: 5,),
              const Badge(
                label: Text("5"),
                child: Appbaricons(
                  child: Icon(Icons.notifications, color: Colors.blue,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
