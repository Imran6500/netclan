import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:get/get.dart';

class Purpose {
  String purpose;
  bool selected;
  Purpose({
    required this.purpose,
    this.selected = false,
  });
}

class HomeVM extends GetxController with GetSingleTickerProviderStateMixin {
  RxInt index = 0.obs;
  int localDistance = 40;

  List<UserModel> usersList2 = [
    UserModel(
        name: "Warriores Gamer",
        sname: "WG",
        status: "+ INVITE",
        address: "Azamgarh",
        business: ["Student", "1 year of experience"],
        radius: "66.8 KM",
        description: 'Hii community! I am available at your service!'),
    UserModel(
        name: "Mohafiz Mehadi",
        sname: "WG",
        status: "+ INVITE",
        address: "Azamgarh",
        business: ["Student", "0 year of experience"],
        radius: "94.5 KM",
        description: 'Hii community! I am available at your service!'),
  ];

  List<UserModel> usersList = [
    UserModel(
        name: "Imran Hashmi",
        sname: "IH",
        status: "+ INVITE",
        address: "Azamgarh",
        business: ["Coffee", "Business", "Friendship"],
        radius: "100m",
        description: 'Hii community! I am open to new connections "😊"'),
    UserModel(
        name: "Prachi Singh",
        sname: "PS",
        address: "Varanasi",
        status: "+ INVITE",
        business: ["Coffee", "Business", "Friendship"],
        radius: "19.1 KM",
        description: 'Hii community! I am open to new connections "😊"'),
    UserModel(
        name: "Nitesh Chauhan",
        sname: "NC",
        status: "+ INVITE",
        address: "Azamgarh",
        business: ["Coffee", "Business", "Friendship"],
        radius: "24.5 KM",
        description: 'Hii community! I am open to new connections "😊"'),
    UserModel(
        name: "Akanksha Tripathi",
        sname: "AT",
        address: "Jaunpur",
        status: "+ INVITE",
        business: ["Coffee", "Business", "Friendship"],
        radius: "25.4 KM",
        description: 'Hii community! I am open to new connections "😊"'),
  ];
  late TabController tabController;
  TextEditingController statusController = TextEditingController();
  String availability = "Available | Hey Let Us Connet";
  List<String> availabilityList = [
    "Available | Hey Let Us Connet",
    "Away | Stay Discreet And Watch",
    "Busy | Do Not Disturb | Will Catch Up Lat..",
    "SOS | Emergency! Need Assistance! HEL..",
    "sdnjio"
  ];
  List<Purpose> purposeList = [
    Purpose(purpose: "Coffee", selected: true),
    Purpose(purpose: "Business", selected: true),
    Purpose(purpose: "Hobbies"),
    Purpose(purpose: "Friendship", selected: true),
    Purpose(purpose: "Movies"),
    Purpose(purpose: "Dinning"),
    Purpose(purpose: "Dating"),
    Purpose(purpose: "Matrimony"),
  ];

  List<Purpose> userPurpose = [
    Purpose(purpose: "Coffee"),
    Purpose(purpose: "Business"),
    Purpose(purpose: "Hobbies"),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    statusController.text = 'Hii community! I am open to new connections "😊"';
    update();
    super.onInit();
  }
}
