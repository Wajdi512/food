import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DishAddStatefulWidget extends StatefulWidget {
  const DishAddStatefulWidget({Key? key}) : super(key: key);

  @override
  State<DishAddStatefulWidget> createState() => _DishAddStatefulWidget();
}

class _DishAddStatefulWidget extends State<DishAddStatefulWidget> {
  TextEditingController dishNameController = TextEditingController();
  TextEditingController dishDescController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  CollectionReference dishes = FirebaseFirestore.instance.collection('dishes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Add a new dish',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Fill the form below',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: dishNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Dish Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: dishDescController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: timeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Time needed(Hours)',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        if (dishNameController.text != "" &&
                            timeController.text != "" &&
                            dishDescController.text != "") {
                          dishes
                              .add({
                                "name": dishNameController.text,
                                "description": dishDescController.text,
                                "time": timeController.text
                              })
                              .then((value) => showAlert(
                                  context,
                                  "Added succesfully",
                                  dishNameController.text +
                                      " was added succesfully"))
                              .catchError((onError) => showAlert(
                                  context, "Failure", onError.toString()));
                        } else {
                          showAlert(context, "Invalid", "can you please fill all the input correctly");
                        }
                      },
                    )),
              ],
            )));
  }

  void showAlert(BuildContext context, String title, String body) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
