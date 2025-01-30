import 'package:flutter/material.dart';

class SearchbarAnim extends StatefulWidget {
  const SearchbarAnim({super.key});

  @override
  State<SearchbarAnim> createState() => _SearchbarAnimState();
}

class _SearchbarAnimState extends State<SearchbarAnim> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
          Expanded(
            child: Container(
              child: const Padding(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10),
            child: InkWell(
                onTap: () {
                  setState(() {
                    isOpened = !isOpened;
                  });
                },
                child: const Icon(Icons.close, color: Colors.black,)),
          )
        ],
      ) : InkWell(
        onTap: () {
          setState(() {
            isOpened = !isOpened;
          });
        },
          child: const Icon(Icons.search_rounded)),
    );
  }
}
