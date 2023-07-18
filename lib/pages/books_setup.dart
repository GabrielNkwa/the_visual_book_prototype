// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_visiual_book/main.dart';

class BookSetup extends StatelessWidget {
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
                'Exciting Moment',
                style: TextStyle(fontSize: 24.0),
              ),
              const Text('Its time to unlock your Visual Book'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('ITS READY'),
              ),
            ],
          ),
        ),
      );
}
