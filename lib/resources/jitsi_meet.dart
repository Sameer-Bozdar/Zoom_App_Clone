import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone/resources/authMethods.dart';
import 'package:zoom_clone/resources/firestoreMethds.dart';

class JitsiMeetMethods {
  final AuthMethod _authMethod = AuthMethod();
  final FireStoreMethods _fireStoreMethods = FireStoreMethods();
  final FirebaseAuth auth = FirebaseAuth.instance;

  User get user => auth.currentUser!;

  // String username = '';

  void createMeeting(
      {required String roomName,
      required bool audioMuted,
      required bool videomuted,
      required String username}) async {
    try {
      Map<String, Object> featureFlags = {};
      String? name;
      if (username.isEmpty) {
        name = _authMethod.user.displayName;
      } else {
        name = username;
      }
      // Define meetings options here
      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,

        // token: tokenText.text,
        isAudioMuted: audioMuted,
        // isAudioOnly: true,
        isVideoMuted: videomuted,
        userDisplayName: name,
        userEmail: _authMethod.user.email,
        featureFlags: featureFlags,
      );

      // debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeetWrapper.joinMeeting(
          options: options,
          listener: JitsiMeetingListener(
              onOpened: () => debugPrint("onOpened"),
              onConferenceWillJoin: (url) {
                debugPrint("onConferenceWillJoin: url: $url");
              }));
      _fireStoreMethods.addMeetingToHistory(roomName);
    } catch (e) {
      print(e.toString());
    }
  }
}
