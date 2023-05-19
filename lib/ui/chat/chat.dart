import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/widgets/drawer.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    drawer: MyDrawer(),
      body: Container(
        child : Text("sbj jsni")
      ),
    );;
  }
}