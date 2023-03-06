import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firestore/firestoredatabase.dart';

class ListDishesWidget extends StatefulWidget {
  const ListDishesWidget({Key? key}) : super(key: key);

  @override
  State<ListDishesWidget> createState() => _ListDishesWidget();
}

class _ListDishesWidget extends State<ListDishesWidget> {
  List dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of dishes"),
        ),
        body: FutureBuilder(
          future: FireStoreDataBase().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text(
                "Something went wrong",
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              dataList = snapshot.data as List;
              return buildItems(dataList);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget buildItems(dataList) => ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: dataList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            dataList[index]["name"],
            style: TextStyle(color: Colors.red),
          ),
          subtitle: Text(
            dataList[index]["description"],
            style: TextStyle(color: Colors.blue[450]),
          ),
          leading: Icon(
            Icons.food_bank_rounded,
            color: Colors.green,
          ),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline_rounded),
            onPressed: () {
              print("testiiing " + dataList[index]["name"]);
              print("testiiing " + dataList[index].toString());

              confirmDelete(context, "Delete Dish", "Are you sure?",
                  dataList[index]["name"]);
            },
          ),
        );
      });

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

  void confirmDelete(
      BuildContext context, String title, String body, String id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              FireStoreDataBase().delete(id).then(
                  (value) => Navigator.pushNamed(context, '/list-dishes'));
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
