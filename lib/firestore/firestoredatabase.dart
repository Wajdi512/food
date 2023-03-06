import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDataBase {
  static String userName = "";
  List studentsList = [];

    List favoritesList = [];

  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("dishes");

  final CollectionReference favorites =
      FirebaseFirestore.instance.collection("favorites");

  Future getData() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("<your document ID here>").get();

      // to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentsList.add(result.data());
        }
      });

      return studentsList;
    } catch (e) {
      return e;
    }
  }

  Future getFavorites() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("<your document ID here>").get();

      // to get data from all documents sequentially
      await favorites.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          favoritesList.add(result.data());
        }
      });

      return favoritesList;
    } catch (e) {
      return e;
    }
  }

  Future<void> delete(String productId) async {
    var snapshot = await collectionRef.where('name', isEqualTo: productId).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
