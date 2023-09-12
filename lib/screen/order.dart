import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
        itemBuilder: (context,index){
          return const Card(
            elevation: 0,
            child: ListTile(
              title: Text('Order #52001'),
              subtitle: Text('Service Type : Carpenter'),
              trailing: Text('28 Nov 2019'),
            ),
          );
        }
    );
  }
}
