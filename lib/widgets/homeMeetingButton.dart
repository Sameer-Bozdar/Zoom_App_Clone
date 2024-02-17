import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeMeetingButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  HomeMeetingButton({super.key, required this.title, required this.onPressed, required this.icon});

  @override
  State<HomeMeetingButton> createState() => _HomeMeetingButtonState();
}

class _HomeMeetingButtonState extends State<HomeMeetingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06),
                      offset: const Offset(0, 4)),
                ],
              ),
              height: 60,
              width: 60,
              child: Icon(widget.icon, color: Colors.white,)),
          SizedBox(height: 10),
          Text(widget.title, style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }
}
