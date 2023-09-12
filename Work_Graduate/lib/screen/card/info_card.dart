import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:work_graduate/widget/custom_shape.dart';
import 'package:work_graduate/widget/my_map.dart';
import '../../api/api_order_controller.dart';
import '../../models/Order.dart';
import '../../models/User.dart';

class InfoCard extends StatefulWidget {
  InfoCard({Key? key, required this.detailsController, required this.photo}) : super(key: key);

  final TextEditingController detailsController;
  final File photo;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  late TextEditingController _detaileAddressController;
  late TextEditingController _phoneController;
  late String lat;
  late String long;
  late String token;

  User get user {
    User user = User();
    user.token= token;
    return user;
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Nzc2N2JmYS1mZWVhLTQ0MTEtOWE0My0wYTliNzE4Y2YwZmEiLCJqdGkiOiJjNTU3ZDRjZDJkZjViZjI2MWVjNzYzZjUyODI1Y2MzMzJiNTAxZjVjNDNlYjc2YWE0MjBhZjZhNTliNGZhNDc0YjdjMmE3YzMxNWVkODgzYyIsImlhdCI6MTY4NjQxNTIwNywibmJmIjoxNjg2NDE1MjA3LCJleHAiOjE3MTgwMzc2MDcsInN1YiI6IjM2MiIsInNjb3BlcyI6W119.aAENe2SZHb1L_MYVluixNwHgyCW8PogAPrzEBuD1gzRZMV4eaazNH2-rBl4JX-_3byRpWgKnH1eeTC-wL2ELIS6oKvsIox97GYECOL4UZyr3WIrKnaLP1Z7Q6i5XRxC7urWtB2bpzC1dErt_KULp-6nbLda32TPOWoGpVtQnqxtMQOA-2EY58xbZfSMR1SxAgUSIEKcVOxesM0nqOb6VO3tsdsKkPetK_EdHftuc9Y7PIdlV8-ZBVHaxITq2frZ0RCs6ypgjilZV6M7_8dGTIKElO64_Hp6n1BKmwzSncogXPFfSruz7fdvmbTLJSx-o31xr9s-QY3PSPbAj7PX3kweVL-0uMnhhhW1bxrn64sIyN1r2T2dvPHeZ5WSjMNOpxr64-KnoqvbZkiw5UOCTCB-V6nQapKk8Kv8D7MFATF_K_Wbg08SI9WqGDPASgyFRKc7ZdsA5povNlPixI91FWC7P3b4cjQLCa6zyookuoKbIlrmS231f9wiYR6W8by5zXUdqpbGpXSa91QYiLKjO5Fjyzihh88JVeLwVGPgnuMjDM6V9Xra_hFom6jVEGdOaZ0xRRPoAfGkTvvhluyheAGSLTuhOThXRkMnt_xrxW5j3Wj_jwVOMXzkvkNY0c0q-zIHzTlBi1d8DRWPhE-z5DKOPprsv5bm_XK8fWtgxD8E';
    lat = '31.31';
    long = '34.534';
    _phoneController = TextEditingController();
    _detaileAddressController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneController.dispose();
    _detaileAddressController.dispose();
    super.dispose();
  }

  Future<Position> _getCurrentLocation() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled){
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permission are denied');
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permission are permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Location'),
        centerTitle: true,
        elevation: 0,
        leading: Align(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0x6fffffff),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(left: 10),
                width: 33,
                height: 33,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.centerEnd,
                end: AlignmentDirectional.centerStart,
                colors: [Color(0xff346EDF), Color(0xff6FC8FB)]),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                Stack(
                  children: [
                    MyMap(lat: lat,long: long),
                    IconButton(onPressed: (){
                       _getCurrentLocation().then((value) {
                         lat = '${value.altitude}';
                         long = '${value.longitude}';
                      setState((){});

                     });
                    }, icon: Icon(Icons.my_location))

                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: _detaileAddressController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'More Details About Problem …...',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color(0xe2346edf))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color(0xe2346edf))
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 15),
                  margin: EdgeInsets.all(10),
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
                        textFieldController: _phoneController,
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle:
                        const TextStyle(color: Colors.black),
                        // textFieldController: controller,
                        formatInput: false,
                        maxLength: 9,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        cursorColor: Colors.black,
                        inputDecoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          hintText: 'Phone Number',
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
                const SizedBox(height: 85),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: const Size(305, 55),
                    ),
                    onPressed: () {
                      // location();
                      Navigator.pushReplacementNamed(context, '/order_done');
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                        bottom: 18,
                      ),
                      child: Text(
                        "ADD ORDER",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
          )),
    );
  }

  Future<void> location() async {
    if (checkData()) {
      await next();
    }
  }

  bool checkData() {
    if (_phoneController.text.isNotEmpty && _detaileAddressController.text.isNotEmpty) {
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

  Future<void> next() async {
    bool status = await ApiOrderController().createOrder(context, order: order,photoOrder: photoOrder);
    if (status) {
      Navigator.pushReplacementNamed(context, '/order_done');
    }
  }

  Order get order {
    Order order = Order();
    order.detailsAddress = _detaileAddressController.text;
    order.phone = _detaileAddressController.text;
    order.details = widget.detailsController.text;
    order.lat = lat;
    order.long = long;
    return order;
  }
  PhotoOrder get photoOrder {
    PhotoOrder photoOrder = PhotoOrder();
    photoOrder.photo = widget.photo.path;
    return photoOrder;
  }

  
}


