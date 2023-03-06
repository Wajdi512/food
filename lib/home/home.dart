import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/foodhome.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
              child: const Text(
                'Welcome To Dishes APP',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blueAccent),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 250, 10, 10),
                height: 300,
                width: 600.0,
                child: ElevatedButton(
                  child: const Text('Go to LOGIN'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )),
            Container(
                height: 50,
                width: 600.0,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign in'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                ))
          ],
        ),
      ),
    ]));
  }
}
