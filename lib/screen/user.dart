import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/language_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<String> _lang = ["en", "ar"];
  String _selectedLang = "ar";
  @override
  Widget build(BuildContext context) {
    List option = ['Language', 'My Rates', 'Contact us', 'Share App'];
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.centerEnd,
                      end: AlignmentDirectional.centerStart,
                      colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 104,
                        height: 104,
                        child: Image.asset('assets/img/img.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Seraj Al Mutawa',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset('assets/img/edit.svg'),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Riyadh, Saudi Arabia',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
          Container(
            color: Colors.white,
            height: 230,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Provider.of<LanguageProvider>(context,listen: false).changeLanguage();
                  },
                  title: Text('Language'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {},
                  title: Text('My Rates'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {},
                  title: Text('Contact us'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {},
                  title: Text('Share App'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 55,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/img/ic.svg'),
                    const SizedBox(width: 5),
                    const Text(
                      'SIGN OUT',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff0E4DFB)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
