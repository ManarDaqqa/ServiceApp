import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  late PageController _pageController;



  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> onbordingData = [
      {
        'image':
        'assets/img/mobile-application-call-taxi-vector-illustration_82574-3185.png',
        'text': AppLocalizations.of(context)!.onboarding,
      },
      {
        'image': 'assets/img/2352195.png',
        'text': AppLocalizations.of(context)!.onboarding,
      },
      {
        'image':
        'assets/img/mobile-application-call-taxi-vector-illustration_8574-3185.png',
        'text': AppLocalizations.of(context)!.onboarding,
      }
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 5,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onbordingData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(onbordingData[index]['image'].toString()),
                      const SizedBox(height: 31),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          onbordingData[index]['text'].toString(),
                          style: const TextStyle(
                              color: Color(0xff0E9CF9),
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                }),
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
                    minimumSize: const Size(305, 55),
                  ),
                  onPressed: () {
                    _pageController.animateToPage(++currentPage,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                    if (currentPage == 3) {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    }
                  },
                  child:  Padding(
                    padding: const EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.next,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ))),
          const SizedBox(height: 10)
        ],
      )),
    );
  }
}
