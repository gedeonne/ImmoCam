import 'package:flutter/material.dart';

class NeumorphismTextfield extends StatefulWidget {
  final String hintext;
  final bool isPassword;
  final TextEditingController controller;
  final onChange;
  final Widget? prefixIcon;
  const NeumorphismTextfield({super.key, required this.hintext, this.isPassword = false, required this.controller, this.onChange, this.prefixIcon});

  @override
  State<NeumorphismTextfield> createState() => _NeumorphismTextfieldState();
}

class _NeumorphismTextfieldState extends State<NeumorphismTextfield> {
  final focusNode = FocusNode();
  bool obscured = true;
  final Color baseColor = Color(0xFFE0E5EC); // Neumorphic background color
  final Color highlightColor = Colors.white;
  FocusNode? activeField;
  bool isActive = false;
  final Color shadowColor = Color(0xFFB3B7C0);
  @override
  void initState() {
    // TODO: implement initState
    focusNode.addListener(() {
      setState(() {
        activeField = focusNode.hasFocus ? focusNode : null;
      });
    });

    isActive = activeField == focusNode;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
      child: TextFormField(
        onChanged: widget.onChange,
        focusNode: focusNode,
        obscureText: widget.isPassword?  obscured : false,
        decoration: InputDecoration(
          hintText: widget.hintext,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword? IconButton(
              onPressed: (){
                setState(() {
                  obscured = !obscured;
                });
              },
              icon: Icon( obscured? Icons.visibility_off : Icons.visibility)
          ) : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
