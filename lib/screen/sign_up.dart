import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../api/api_auth_controller.dart';
import '../models/User.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
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
              begin: AlignmentDirectional.centerEnd,
              end: AlignmentDirectional.centerStart,
              colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 46),
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0x6fffffff),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(left: 10),
                    width: 33,
                    height: 33,
                    child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
                )),
            const SizedBox(height: 46),
            Expanded(
              flex: 3,
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
                       Text(AppLocalizations.of(context)!.signUP,
                          style: TextStyle(
                              color: Color(0xff0091FF), fontSize: 30)),
                      const SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.fullName,
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
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffAF8344)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffeeeeee),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                print(number.phoneNumber);
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle:
                                  const TextStyle(color: Colors.black),
                              textFieldController: _phoneController,
                              formatInput: false,
                              maxLength: 9,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              cursorColor: Colors.black,
                              inputDecoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 15, left: 0),
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)!.phone,
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 16),
                              ),
                              onSaved: (PhoneNumber number) {
                                print('On Saved: $number');
                              },
                            ),
                            Positioned(
                              left: 90,
                              top: 8,
                              bottom: 8,
                              child: Container(
                                height: 40,
                                width: 1,
                                color: Colors.black.withOpacity(0.13),
                              ),
                            )
                          ],
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
                          suffixIcon: const Icon(Icons.remove_red_eye,
                              color: Color(0xffAF8344)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              checkColor: Colors.white,
                              activeColor: const Color(0xff0091FF),
                              value: true,
                              onChanged: (value) {
                                // setState((){});
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0, top: 0),
                              title:  Text(
                                AppLocalizations.of(context)!.iRead,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: (){},
                              child: Text(
                                AppLocalizations.of(context)!.homeService,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF0E4DFB),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(AppLocalizations.of(context)!.haveAccount,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff272727))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, '/login_screen');
                                  },
                                  child:  Text(AppLocalizations.of(context)!.signIN,
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0091FF),
                                      )))
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
                                    performSignUp();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 18,
                                      bottom: 18,
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.signUP,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                        ],
                      ),
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

  Future<void> performSignUp() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty
    ) {
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
  Future<void> register() async {
    // bool status = await FbAuthController().signUp(context, email: _emailController.text, password: _passwordController.text);
    bool status = await ApiAuthController().register(context,
        user: user);
    if (status) {
      Navigator.pop(context);
    }
  }

  User get user {
    User user = User();
    user.name = _nameController.text;
    user.email = _emailController.text;
    user.password = _passwordController.text;
    user.phone = _phoneController.text;
    return user;
  }
}
