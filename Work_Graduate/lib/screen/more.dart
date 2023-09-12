import 'package:flutter/material.dart';

import '../widget/custom_shape.dart';

class MoreScreen extends StatelessWidget {
   MoreScreen({Key? key}) : super(key: key);

   List<String> more = ['Change Password','FAQ\'s','About App','Terms & Conditions','Privacy Policy','Rate App','Delete Account'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: CustomShape(),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.centerEnd,
                  end: AlignmentDirectional.centerStart,
                  colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
            ),
          ),
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: more.length,
              itemBuilder: (context,index){
                return ListTile(
                  onTap: (){},
                  title: Text('${more[index]}'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded) ,
                );
              }
          ),
        ),
      ],
    );
  }
}
