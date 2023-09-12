import 'package:flutter/material.dart';

class OrderDone extends StatelessWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100,),
          Image.asset('assets/img/illustration.png'),
          const Text('ORDER Done!',style: TextStyle(fontSize: 24),),
          const SizedBox(height: 15),
          const Text('The ORDER has been sent. A technician will contact you',style: TextStyle(fontSize: 14),),
          const SizedBox(height: 100),
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
                    Navigator.pushReplacementNamed(context,'/home_screen');
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                    ),
                    child: Text(
                      "GO TO HOME",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ))),
        ],
      ),
    );
  }
}
