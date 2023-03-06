import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hello, what's up!")),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/foodhome.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Hope you find your favorite dishes here',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.lightBlue),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 250, 10, 10),
                    height: 300,
                    width: 600.0,
                    child: ElevatedButton(
                      child: const Text('Dishes List'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/list-dishes-for-user');
                      },
                    )),
                Container(
                    height: 50,
                    width: 600.0,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Your Favorite dishes'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/list-favorites');
                      },
                    ))
              ],
            ),
          ),
        ]));
  }
}
