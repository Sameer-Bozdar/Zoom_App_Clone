import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String title;
  final VoidCallback onTap;
  CustomButton({super.key, required this.title, required this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          height: size.height * .060,
        width: size.width * .90,
       decoration: BoxDecoration(
       borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.lightBlue,
       ),
        child: Center(child: Text(widget.title, style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
