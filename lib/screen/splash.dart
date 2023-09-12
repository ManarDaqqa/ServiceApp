import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // String route = SharedPrefController().loggedIn ? '/bottom_nav_bar' : '/onbording_screen';
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
            ),
          ),
          Positioned(
            top: 219,
              left: 110,
              child: Image.asset('assets/img/Layer.png')
          )
        ],
      ),
    );
  }
}
