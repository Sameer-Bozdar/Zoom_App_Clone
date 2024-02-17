import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOptionWidget extends StatelessWidget {
  final String text;
  final bool isMuted;
  
  final Function(bool) onChange;

  const MeetingOptionWidget({super.key, required this.text, required this.isMuted, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(

mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          
          ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Switch.adaptive(
                value: isMuted,
                onChanged: onChange,
              ),
            ),
        ],
      ),
    );
  }
}
