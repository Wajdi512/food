import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firestore/firestoredatabase.dart';
import 'package:my_app/login/login.dart';

class ListDishesForUserWidget extends StatefulWidget {
  const ListDishesForUserWidget({Key? key}) : super(key: key);

  @override
  State<ListDishesForUserWidget> createState() => _ListDishesForUserWidget();
}

class _ListDishesForUserWidget extends State<ListDishesForUserWidget> {
  List dataList = [];
  CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');
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
            icon: Icon(Icons.favorite),
            onPressed: () {
              favorites.add({
                "name": dataList[index]["name"],
                "username": FireStoreDataBase.userName,
                "time": dataList[index]["time"],
                "description": dataList[index]["description"]
              }).then((value) =>
                  {showAlert(context, "Added to favorites", "success")});
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
