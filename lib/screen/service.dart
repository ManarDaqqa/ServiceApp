import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:work_graduate/get/service_getx_controller.dart';
import 'package:work_graduate/widget/custom_shape.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 190,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.centerEnd,
                        end: AlignmentDirectional.centerStart,
                        colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
          ),
          const Text(
            'Select Service',
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx((){
              if(serviceController.isLoading.value){
                return const Center(child: CircularProgressIndicator());
              }else if (serviceController.servicedata.isNotEmpty){
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 29.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: serviceController.servicedata.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/choice_card');
                      },
                      child: Container(
                        height: 85,
                        width: 94,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.pinkAccent.shade100)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/img/Forma 1.png',fit: BoxFit.fill,),
                            const SizedBox(height: 5),
                            Text(
                              '${serviceController.servicedata[index].name}',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.blue.shade500),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                            'assets/img/paper.png'),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'NO DATA',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}








