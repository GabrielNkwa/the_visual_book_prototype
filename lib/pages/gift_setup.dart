// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_visiual_book/main.dart';
import 'package:the_visiual_book/pages/invite_family.dart';
import 'package:the_visiual_book/pages/photo_gallery.dart';
import 'package:the_visiual_book/pages/prepare_visual_book.dart';
import 'package:the_visiual_book/pages/qrcode_scanner.dart';
import 'package:the_visiual_book/screens/home_screen.dart';
import 'dart:math';

import '../reusable_widgets/reusable_widget.dart';

class GiftSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('The Visual Book'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Let`s connect the Visual Book',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              const Text(
                'Kindly choose how you wish to pair the Visual Book',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VirtualCode()),
                  );
                },
                child: Text('GENERATE A VIRTUAL CODE'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => scanBarcode(),
                child: Text('SET UP USING QR CODE'),
              ),
            ],
          ),
        ),
      );
}

class VirtualCode extends StatefulWidget {
  const VirtualCode({super.key});

  @override
  State<VirtualCode> createState() => _VirtualCodeState();
}

class _VirtualCodeState extends State<VirtualCode> {
  TextEditingController _giftTextController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('The Visual Book'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  "Who are you preparing the Visual Book for?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  "Set the recipient's name or add title, they can rename the book later",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              reusableTextField("Enter Title", Icons.person_2_outlined, false,
                  _giftTextController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Code()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Background color
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );
}

class Code extends StatefulWidget {
  const Code({super.key});

  @override
  State<Code> createState() => _CodeState();
}

class _CodeState extends State<Code> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('The Visual Book'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  "We have emailed yoy the claim code for later",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  "Now, prepare a gift by adding a message, photo or video. Then share the code below with ......",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Prepare()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Background color
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );
}

class Prepare extends StatefulWidget {
  const Prepare({super.key});

  @override
  State<Prepare> createState() => _PrepareState();
}

class _PrepareState extends State<Prepare> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('The Visual Book'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  "Prepare the Visual Book for its destination",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15), //apply padding to all four sides
                child: Text(
                  "For the best surprise, complete all the options before the recipient connects to their book",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GiftMessagePhotos()),
                  );
                },
                child: Text('GIFT MESSAGE PHOTOS'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InviteFamily()),
                  );
                },
                child: Text('INVITE FAMILY AND FRIENDS'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImagePickerScreen()),
                  );
                },
                child: Text('ADD PHOTOS AND ALBUMS'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => ImagePickerScreen()),
                  // );
                },
                child: Text('CHOOSE WIFI CONNECTION'),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Background color
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      );
}
