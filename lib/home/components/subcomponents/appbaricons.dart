import 'package:flutter/material.dart';

class Appbaricons extends StatelessWidget {
  final Widget child;
  const Appbaricons({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: kElevationToShadow[2]
      ),
      child: InkWell(
        onTap: (){},
          child: child
      ),
    );
  }
}
