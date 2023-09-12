import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_graduate/screen/card/info_card.dart';
import 'package:work_graduate/widget/custom_shape.dart';

class ChoiceCard extends StatefulWidget {
  const ChoiceCard({Key? key}) : super(key: key);

  @override
  State<ChoiceCard> createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();
  late void Function(File pickedImage) imagePickFn;
  late TextEditingController _detailsController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _detailsController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Smith'),
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
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  color: const Color(0xff4e6bf1),
                  strokeWidth: 1,
                  dashPattern: const [
                    5,
                    5,
                  ],
                  child: GestureDetector(
                    onTap: () {
                      selectImage();
                    },
                    child: Container(
                      width: 320,
                      height: 50,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/img/profile.svg',
                          ),
                          const SizedBox(width: 70),
                          const Text('Image Problem'),
                        ],
                      ),
                    ),
                  ),
                ),
                _pickedImage == null
                    ? const SizedBox()
                    : smith() == true
                        ? SizedBox()
                        : Image.file(
                            File(_pickedImage!.path),
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                const SizedBox(height: 13),
                const Text(
                  'image must be no more than 2 MB Max 5 Image',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 44),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _detailsController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'More Details About Problem …...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xe2346edf))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xe2346edf))),
                ),
              ),
            ),
            const SizedBox(
              height: 210,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: const Size(305, 55),
                ),
                onPressed: () {
                  smith();
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 18,
                    bottom: 18,
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      )),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            _pickImage(ImageSource.gallery);
                            if (_pickedImage != null) {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/pgallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            _pickImage(ImageSource.camera);
                            if (_pickedImage != null) {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _pickImage(ImageSource src) async {
    final XFile? pickedImageFile =
        await _picker.pickImage(source: src, imageQuality: 50);

    if (pickedImageFile != null) {
      setState(() {
        _pickedImage = File(pickedImageFile.path);
      });
      // photo.add(_pickedImage!);
      // widget.imagePickFn(_pickedImage!);
    } else {
      print('No Image Selected');
      return;
    }
  }

  Future<void> smith() async {
    if (checkData()) {
      await next();
    }
  }

  bool checkData() {
    if (_pickedImage!.path.isNotEmpty && _detailsController.text.isNotEmpty) {
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InfoCard(
                  detailsController: _detailsController,
                  photo: _pickedImage!,
                )));
  }
}
