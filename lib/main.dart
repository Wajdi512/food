import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/dishes/editdishes.dart';
import 'package:my_app/dishes/listdishes.dart';
import 'package:my_app/dishes/listdishesforusers.dart';
import 'package:my_app/dishes/listfavoritedishes.dart';
import 'package:my_app/home/dashboard/admin-dashboard.dart';
import 'package:my_app/home/dashboard/user-dashboard.dart';
import 'package:my_app/home/home.dart';
import 'package:my_app/login/login.dart';
import 'package:my_app/signup/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "flutter project",
      options: const FirebaseOptions(
          apiKey: "AIzaSyBie161lPHIqXZxuobPvcOuo4EN1E_5IOU",
          appId: "1:341482377487:web:d8142aeec2ca9d996c6e7a",
          messagingSenderId: "341482377487",
          projectId: "mini-projet-flutter-f4921"));
  runApp(
    MaterialApp(
      title: 'Dishes',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => const LoginWidget(),
        '/signin': (context) => const SignupStatefulWWidget(),
        '/user-dashboard': (context) => const UserDashboard(),
        '/admin-dashboard': (context) => const AdminDashboard(),
        '/add-dish': ((context) => const DishAddStatefulWidget()),
        '/list-dishes': ((context) => const ListDishesWidget()),
        '/list-dishes-for-user': (((context) =>
            const ListDishesForUserWidget())),
        '/list-favorites': (((context) =>
            const ListFavoirteDishesForUserWidget()))
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const LoginWidget(),
    );
  }
}
