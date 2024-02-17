import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart";
import "package:zoom_clone/resources/authMethods.dart";
import "package:zoom_clone/resources/jitsi_meet.dart";
import "package:zoom_clone/utils/colors.dart";
import "package:zoom_clone/widgets/meetingOptionWidget.dart";

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late TextEditingController _namecontroller;
  late TextEditingController _meetingcontroller;
  final AuthMethod authMethod = AuthMethod();

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  @override
  void initState() {
    _meetingcontroller = TextEditingController();
    _namecontroller = TextEditingController(text: authMethod.user.displayName);
    // TODO: implement initState
    super.initState();
  }

  void _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
        roomName: _meetingcontroller.text,
        audioMuted: isAudioMuted,
        videomuted: isVideoMuted, 
        username: _namecontroller.text
        );
  }

  bool isAudioMuted = true;
  bool isVideoMuted = true;
  // TextEditingController _meetingcontroller = TextEditingController();

  // final TextEditingController _namecontroller =
  //     TextEditingController(text: authMethod.user.displayName);
  @override
  void dispose() {
    _meetingcontroller.dispose();
    _namecontroller.dispose();
    //  JitsiMeetingListener.removeAllListeners();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Screen",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: secondaryBackgroundColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _meetingcontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Room ID",
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: secondaryBackgroundColor,
                enabled: true,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(16, 6, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _namecontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                // hintText: "User name",
                filled: true,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                fillColor: secondaryBackgroundColor,
                enabled: true,
                contentPadding: EdgeInsets.fromLTRB(16, 6, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Center(
                child: Text("Join",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ),
          SizedBox(
            height: 20,
          ),
          MeetingOptionWidget(
            text: "Mute Audio",
            isMuted: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOptionWidget(
            text: "Turn Off my video ",
            isMuted: isVideoMuted,
            onChange: onVideoMuted,
          )
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
