import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/home/home_viewmodel.dart';
import 'package:flutter_application_1/utils/widgets/drawer.dart';
import 'package:get/get.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  HomeVM vm = Get.isRegistered<HomeVM>() ? Get.find() : Get.put(HomeVM());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (context) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff0e2e43),
              foregroundColor: Colors.white,
              centerTitle: false,
              leadingWidth: 40,
              title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Howdy Imaran Hashmi !!",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 15),
                        Text(
                          "tirauli",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ]),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined),
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size(Get.width, 45),
                child: Container(
                  color: Color.fromARGB(255, 13, 57, 87),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey.shade400,
                    controller: vm.tabController,
                    indicatorColor: Colors.white,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.people),
                      ),
                      Tab(
                        icon: Icon(Icons.breakfast_dining),
                      ),
                      Tab(
                        icon: Icon(Icons.shop),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            drawer: MyDrawer(),
            body: TabBarView(
                controller: vm.tabController,
                children: const [Tab1(), Tab2(), Tab3()])),
      );
    });
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (vm) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 35.0, bottom: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width - 120,
                  height: 25,
                  child: TextFormField(
                    // style: ,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 6)),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 15,
                        )),
                  ),
                ),
                const Icon(Icons.format_list_numbered_rtl)
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: Get.height - 275,
              child: ListView.separated(
                  itemBuilder: (context, i) {
                    return Container(
                      // height: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(left: 25),
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 18, right: 18, top: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                const BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          print("xndi");
                                          if (vm.usersList[i].status !=
                                              "PENDING") {
                                            vm.usersList[i].status = "PENDING";
                                            vm.update();
                                          }
                                        },
                                        child: Text(
                                          vm.usersList[i].status,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: vm.usersList[i].status !=
                                                    "PENDING"
                                                ? const Color(0xff0e2e43)
                                                : Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      vm.usersList[i].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                        "${vm.usersList[i].address}, within ${vm.usersList[i].radius}")
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 120,
                                margin: const EdgeInsets.only(left: 50),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                    height: 11,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff0e2e43),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5))),
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: vm.usersList[i].business
                                    .map((e) => SizedBox(
                                            child: Text(
                                          "$e | ",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )))
                                    .toList(),
                              ),
                              Text(
                                vm.usersList[i].description,
                                style: const TextStyle(
                                  fontSize: 13,
                                  // fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            top: 20,
                            child: Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 192, 208, 218),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  vm.usersList[i].sname,
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Color(0xff0e2e43),
                                  ),
                                )))),
                      ]),
                    );
                  },
                  separatorBuilder: (context, i) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: vm.usersList.length))
        ],
      );
    });
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (vm) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 35.0, bottom: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width - 120,
                  height: 25,
                  child: TextFormField(
                    // style: ,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 6)),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 15,
                        )),
                  ),
                ),
                const Icon(Icons.format_list_numbered_rtl)
              ],
            ),
          ),
          const SizedBox(height: 30),
          Image.asset("assets/images/tab3_logo.jpg", width: 180),
          const SizedBox(height: 20),
          RichText(
              text: const TextSpan(
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  text: "Your explore list is ",
                  children: [
                TextSpan(
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                    text: "EMPTY")
              ])),
          const SizedBox(height: 15),
          const Text(
            "Sorry, we, could not find any user near you.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const Text(
            "Try increasing your search radius.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          Container(
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff0e2e43),
              ),
              child: const Center(
                child: Text(
                  "INCREASE RADIUS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        ],
      );
    });
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (vm) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 35.0, bottom: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width - 120,
                  height: 25,
                  child: TextFormField(
                    // style: ,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 6)),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 15,
                        )),
                  ),
                ),
                const Icon(Icons.format_list_numbered_rtl)
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: Get.height - 275,
              child: ListView.separated(
                  itemBuilder: (context, i) {
                    return Container(
                      // height: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(left: 25),
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 25, right: 18, top: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                const BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          print("xndi");
                                          if (vm.usersList[i].status !=
                                              "PENDING") {
                                            vm.usersList2[i].status = "PENDING";
                                            vm.update();
                                          }
                                        },
                                        child: Text(
                                          vm.usersList[i].status,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: vm.usersList[i].status !=
                                                    "PENDING"
                                                ? const Color(0xff0e2e43)
                                                : Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      vm.usersList[i].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                        "${vm.usersList2[i].address}, within ${vm.usersList2[i].radius}")
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 120,
                                margin: const EdgeInsets.only(left: 50),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(children: [
                                  Container(
                                    width: 40,
                                    height: 11,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff0e2e43),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5))),
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                  width: 100,
                                  margin: const EdgeInsets.only(left: 70),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Color(0xff0e2e43),
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Color(0xff0e2e43),
                                        child: Icon(Icons.person_add_alt_1,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                              const SizedBox(height: 10),
                              Row(
                                children: vm.usersList2[i].business
                                    .map((e) => SizedBox(
                                            child: Text(
                                          "$e | ",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )))
                                    .toList(),
                              ),
                              SizedBox(
                                width: Get.width * 0.7,
                                child: RichText(
                                    text: TextSpan(
                                  text: vm.usersList2[i].description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                    // fontWeight: FontWeight.w500,
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            top: 20,
                            child: Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 192, 208, 218),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  vm.usersList2[i].sname,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Color(0xff0e2e43),
                                  ),
                                )))),
                      ]),
                    );
                  },
                  separatorBuilder: (context, i) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: vm.usersList2.length))
        ],
      );
    });
  }
}
