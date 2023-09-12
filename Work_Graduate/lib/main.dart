import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:work_graduate/pref/sharef_pref_controller.dart';
import 'package:work_graduate/provider/language_provider.dart';
import 'package:work_graduate/screen/home_screen.dart';
import 'package:work_graduate/screen/login.dart';
import 'package:work_graduate/screen/onboarding.dart';
import 'package:work_graduate/screen/sign_up.dart';
import 'package:work_graduate/screen/splash.dart';
import 'package:work_graduate/screen/card/choice_card.dart';
import 'package:work_graduate/screen/card/order_done.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LanguageProvider>(context).language),
      initialRoute: '/splash_screen',

      routes: {
        '/splash_screen':(context) => const SplashScreen(),
        '/onboarding':(context) => const OnBoardingScreen(),
        '/login_screen':(context) =>  LoginScreen(),
        '/signup_screen':(context) =>  SignUpScreen(),
        '/home_screen':(context) => HomeScreen(),
        '/choice_card':(context) =>const ChoiceCard(),
        // '/info_card':(context) =>  InfoCard(),
        '/order_done':(context) => const OrderDone(),
      },
    );
  }
}
