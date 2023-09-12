import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../api/api_auth_controller.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff5927FF),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
          ),
        child: Column(
          children: [

            Expanded(flex: 1, child: Image.asset('assets/img/Layer_home.png')),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(AppLocalizations.of(context)!.login,
                          style:
                          const TextStyle(color: Color(0xff0091FF), fontSize: 30)),
                      const SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.email,
                          enabledBorder:  const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xffAF8344))),
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextField(
                        obscureText: true,
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.pass,
                          enabledBorder:  const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xffAF8344))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              checkColor: Colors.white,
                              activeColor: const Color(0xff0091FF),
                              value: true,
                              onChanged: (value) {
                                // setState((){});
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0, top: 0),
                              title:  Text(
                                AppLocalizations.of(context)!.remember,
                                style: const TextStyle( fontSize: 12),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () => Navigator.pushNamed(context, '/forgot_pass_screen'),
                              child:  Text(
                                AppLocalizations.of(context)!.forgot,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  // color: Get.isDarkMode ? Colors.white : Color(0xFF121212),
                                ),
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(AppLocalizations.of(context)!.member,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff272727)
                                  )
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, '/signup_screen');
                                  },
                                  child:  Text(AppLocalizations.of(context)!.signUP,
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0091FF),
                                      )
                                  ))
                            ],
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xff346EDF),
                                    Color(0xff6FC8FB),
                                    //add more colors
                                  ]),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.57),
                                        //shadow for button
                                        blurRadius: 5) //blur radius of shadow
                                  ]),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onSurface: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    minimumSize: const Size(164, 55),
                                  ),
                                  onPressed: () {
                                    performlogin();
                                    // Navigator.pushReplacementNamed(context, '/home_screen');
                                  },
                                  child:  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 18,
                                      bottom: 18,
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.login,
                                      style:
                                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: (){},
                                child:  Text(AppLocalizations.of(context)!.getStart,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    )
                                )),
                            const Icon(Icons.arrow_forward)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

   Future<void> performlogin() async {
     if (checkData()) {
       await login();
     }
   }

   bool checkData() {
     if (_emailController.text.isNotEmpty &&
         _passwordController.text.isNotEmpty) {
       return true;
     }
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text('Enter required data'),
         backgroundColor: Colors.red,
       ),
     );
     return false;
   }

   Future<void> login() async{
     bool status = await ApiAuthController().login(context, email: _emailController.text, password: _passwordController.text);

     if(status) Navigator.pushReplacementNamed(context, '/home_screen');
   }
}
