// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_visiual_book/pages/books_setup.dart';
import 'package:the_visiual_book/pages/gift_setup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_visiual_book/screens/signin_screen.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 214, 211, 203)),
      home: SignInScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Books(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Visual Book'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Virtual Books'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('ADD BOOK'),
          ),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  final users = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${users?.email}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('CHANGE LANGUAGE'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('CHANGE PASSWORD'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {});
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: Text('SIGN OUT'),
          ),
        ],
      ),
    );
  }
}
