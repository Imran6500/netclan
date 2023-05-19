import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ui/about/about.dart';
import 'package:flutter_application_1/ui/home/home.dart';
import 'package:flutter_application_1/ui/home/home_viewmodel.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  final String imgUrl = "";
  HomeVM vm = Get.isRegistered<HomeVM>() ? Get.find() : Get.put(HomeVM());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (vm) {
      return LogInRequiredDrwaer();
    });
  }
}

class LogInRequiredDrwaer extends StatelessWidget {
  const LogInRequiredDrwaer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (vm) {
      return Drawer(
        child: Container(
          padding: EdgeInsets.zero,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Container(
                  height: Get.height - 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 30),
                          DrawerItems(
                              iconData: Icons.home,
                              title: 'Home',
                              onTapFunc: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => HomeView()))),
                          DrawerItems(
                            iconData: Icons.info_outline_rounded,
                            title: 'About US',
                            onTapFunc: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AboutPage())),
                          ),
                          DrawerItems(
                            iconData: CupertinoIcons.settings_solid,
                            title: 'Setting',
                            onTapFunc: () {},
                          ),
                          const Divider(height: 5, color: Colors.grey),
                          DrawerItems(
                              iconData: CupertinoIcons.lock,
                              title: 'singin',
                              onTapFunc: () {
                                // Get.to(() => LoginPage());
                              })
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('version 2.0.0',
                            style: TextStyle(color: Colors.grey.shade500)),
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key? key,
    required this.title,
    required this.iconData,
    this.onTapFunc,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final Function? onTapFunc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTapFunc != null) {
          onTapFunc!();
        }
      },
      child: ListTile(
        leading: Icon(
          iconData,
          color: (title == "logout")
              ? Colors.red
              : Theme.of(context).textTheme.bodyText1!.color,
        ),
        title: Text(
          title,
          textScaleFactor: 1.2,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: (title == "logout")
                ? Colors.red
                : Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
      ),
    );
  }
}
