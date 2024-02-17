import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:zoom_clone/resources/firestoreMethds.dart";

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FireStoreMethods().meetingDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) { 
                

                final createdAt = (snapshot.data! as dynamic).docs[index]["createdAt"].toDate();
               return  ListTile(
                    title: Text(
                        "Meeting name : ${(snapshot.data! as dynamic).docs[index]["meetingName"]}", style: TextStyle(color: Colors.white, fontSize: 16),),
                    subtitle: Text(
                        "Joined on ${ DateFormat.yMMMd().format(createdAt)}" , style: TextStyle(color: Colors.white, fontSize: 16),));
          });
        });
  }
}
