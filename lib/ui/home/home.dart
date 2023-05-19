import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/home/home_viewmodel.dart';
import 'package:flutter_application_1/utils/widgets/drawer.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeVM vm = Get.isRegistered<HomeVM>() ? Get.find() : Get.put(HomeVM());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVM>(builder: (context) {
      return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
            backgroundColor: Color(0xff0e2e43),
            foregroundColor: Colors.white,
            centerTitle: false,
            leadingWidth: 40,
            title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Howdy Imran Hashmi !!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
            ]),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labelText("Select Your Availability"),
                InputDecorator(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      errorStyle: const TextStyle(
                          color: Colors.redAccent, fontSize: 16.0),
                      hintText: 'Please select expense',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: vm.availability == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      itemHeight: 50,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                      value: vm.availability,
                      isDense: true,
                      onChanged: (newValue) {
                        vm.availability = newValue ?? "";
                        vm.update();
                      },
                      items: vm.availabilityList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                labelText("Add Your Status"),
                TextFormField(
                  minLines: 2,
                  maxLength: 250,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: vm.statusController,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                labelText("Select Hyper local Distance"),
                Slider(
                  value: vm.localDistance.toDouble(),
                  min: 1.0,
                  max: 100.0,
                  secondaryTrackValue: vm.localDistance * 1.0,
                  divisions: 100,
                  activeColor: Color(0xff0e2e43),
                  inactiveColor: Colors.grey,
                  label: '${vm.localDistance}',
                  onChanged: (double newValue) {
                    vm.localDistance = newValue.round();
                    vm.update();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1 Km',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                    Text('100 Km',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ))
                  ],
                ),
                labelText("Select Purpose"),
                Wrap(
                  children: vm.purposeList
                      .map((e) => InkWell(
                            onTap: () {
                              e.selected = !e.selected;
                              vm.update();
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xff0e2e43),
                                  ),
                                  color: e.selected
                                      ? const Color(0xff0e2e43)
                                      : Colors.white,
                                ),
                                child: Text(
                                  e.purpose,
                                  style: TextStyle(
                                    color: e.selected
                                        ? Colors.white
                                        : const Color(0xff0e2e43),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ))
                      .toList(),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xff0e2e43),
                      ),
                      child: const Center(
                        child: Text(
                          "Save & Explore",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                )
              ],
            )),
      );
    });
  }

  Padding labelText(String lable) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Text(lable,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.blueGrey.shade800,
          )),
    );
  }
}
