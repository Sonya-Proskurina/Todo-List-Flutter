import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MainScrin extends StatefulWidget {
  const MainScrin({Key? key}) : super(key: key);

  @override
  _MainScrinState createState() => _MainScrinState();
}

class _MainScrinState extends State<MainScrin> {

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();

    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text("Список дел"),
    backgroundColor: Colors.deepOrangeAccent,
    centerTitle: true,
    ),
      body: Column(
        children: [
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.accessibility_new,
                size: 300,
                color: Colors.deepOrangeAccent,
              ),
            ],
          ),

        Text ( "Тестовое приложение - список задач на флаттер!",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 24,
            ),
          ),


          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/todo');
          }, child: Text("Перейти к списку дел"),
            style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent)
          ),

        ],
      ),
    );
  }
}
