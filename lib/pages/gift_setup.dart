// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_visiual_book/main.dart';

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
                style: TextStyle(fontSize: 24.0),
              ),
              const Text('Kindly choose how you wish to pair the Visual Book'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('GENERATE A VIRTUAL CODE'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('SET UP USING QR CODE'),
              ),
            ],
          ),
        ),
      );
}
