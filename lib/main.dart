import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/chat/chat.dart';
import 'package:flutter_application_1/ui/contact/chat.dart';
import 'package:flutter_application_1/ui/explore/explore.dart';
import 'package:flutter_application_1/ui/home/home.dart';
import 'package:flutter_application_1/ui/home/home_viewmodel.dart';
import 'package:flutter_application_1/ui/network/network.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenNavigate(),
    );
  }
}

class ScreenNavigate extends StatelessWidget {
  ScreenNavigate({Key? key}) : super(key: key);
  HomeVM nv = Get.put(HomeVM());

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = <Widget>[
      HomeView(),
      ExplorePage(),
      const NetworkPage(),
      const ChatPage(),
      const ContactPage()
    ];
    return GetBuilder<HomeVM>(builder: (nv) {
      return Scaffold(
        body: screens.elementAt(nv.index.value),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            navbarItem(icon: Icons.select_all_outlined, label: "Refine"),
            navbarItem(icon: Icons.explore, label: "Explore"),
            navbarItem(
                icon: Icons.network_wifi_3_bar_outlined, label: "Network"),
            navbarItem(icon: Icons.chat, label: "Chat"),
            navbarItem(icon: Icons.contact_mail_sharp, label: "Contact"),
          ],
          currentIndex: nv.index.value,
          onTap: (int index) {
            nv.index.value = index;
            nv.update();
          },
          unselectedItemColor: const Color(0xffa1a1a1),
          selectedItemColor: const Color(0xff415859),
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 25),
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }

  BottomNavigationBarItem navbarItem(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 20),
      label: label,
    );
  }
}
