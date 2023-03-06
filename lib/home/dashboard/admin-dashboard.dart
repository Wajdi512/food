import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});
  void handleClick(String value) {
    switch (value) {
      case 'Add Dish':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Manage all Data"), actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) => {
              
              if (value == 'Add Dish')
                {Navigator.pushNamed(context, "/add-dish")}
              else if (value == 'list of dishes')
                {Navigator.pushNamed(context, "/list-dishes")}
            },
            itemBuilder: (BuildContext context) {
              return {"Add Dish", "list of dishes"}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ]),
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
                  child: const Text(
                    'User dashboard',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.blue),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 250, 10, 10),
                    height: 300,
                    width: 600.0,
                    child: ElevatedButton(
                      child: const Text('Dishes List'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/list-dishes');
                      },
                    )),
                Container(
                    height: 50,
                    width: 600.0,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Add a new dish'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/add-dish');
                      },
                    ))
              ],
            ),
          ),
        ]));
  }
}
