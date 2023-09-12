import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_graduate/models/button_nav.dart';
import 'package:work_graduate/screen/service.dart';
import 'package:work_graduate/screen/order.dart';
import 'package:work_graduate/screen/user.dart';
import 'package:work_graduate/screen/more.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current_index = 0;
  List<dynamic> title = [null, 'Item Details', '', 'More'];
  List<Widget> action = [
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(left: 325),
            child: SvgPicture.asset('assets/img/Shape.svg')),
      ),
    ),
    const SizedBox(),
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset('assets/img/setting.svg'),
      ),
    ),
    const SizedBox()
  ];
  List<ButtonNavigation> screen = [
    ButtonNavigation(ServiceScreen()),
    ButtonNavigation(OrderScreen()),
    ButtonNavigation(UserScreen()),
    ButtonNavigation(MoreScreen()),
  ];
  late bool showAppbar;

  @override
  initState() {
    if (current_index == 0 && current_index == 2) {
      showAppbar = false;
    } else {
      showAppbar = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: current_index == 2 || current_index == 1? null : Colors.white,
      extendBodyBehindAppBar: false,
      appBar:  AppBar(
              elevation: 0,
              title: current_index == 0
                  ? SizedBox(
                height: kToolbarHeight,
                child: Image.asset(
                  'assets/img/Layer_home.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
              )
                  : Text(
                      title[current_index],
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.centerEnd,
                      end: AlignmentDirectional.centerStart,
                      colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              actions: [action[current_index]],
            ),
      body: screen.elementAt(current_index).screen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff6FC8FB),
        currentIndex: current_index,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            current_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/img/Group 10517.svg',
                fit: BoxFit.cover),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/img/receipt.svg'),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/img/Icons 5.svg'),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/img/ic_more_horiz_24px.svg'),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
