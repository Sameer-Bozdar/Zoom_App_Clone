import "dart:math";

import "package:flutter/material.dart";
import "package:zoom_clone/resources/jitsi_meet.dart";
import "package:zoom_clone/screens/video_screen.dart";
import "package:zoom_clone/widgets/homeMeetingButton.dart";

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  createNewMeeting() {
    JitsiMeetMethods _jitsiMethods = JitsiMeetMethods();

    var random = Random();
    var roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMethods.createMeeting(
        roomName: roomName, audioMuted: true, videomuted: true, username: '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                icon: Icons.video_camera_front,
                title: "New Meeting",
                onPressed: createNewMeeting),
            HomeMeetingButton(
              icon: Icons.add_box,
              title: "Join Meeting",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VideoScreen()));
              },
            ),
            HomeMeetingButton(
              icon: Icons.calendar_today,
              title: "Calender",
              onPressed: () {},
            ),
            HomeMeetingButton(
              icon: Icons.arrow_upward_rounded,
              title: "Share Screen",
              onPressed: () {},
            )
          ],
        ),
        Expanded(
            child: Center(
          child: Text(
            "Create/Join meeting with just a click!",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ))
      ],
    );
  }
}
