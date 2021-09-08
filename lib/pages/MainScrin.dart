import 'package:flutter/material.dart';

class MainScrin extends StatefulWidget {
  const MainScrin({Key? key}) : super(key: key);

  @override
  _MainScrinState createState() => _MainScrinState();
}

class _MainScrinState extends State<MainScrin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        title: Text("Список дел"),
    centerTitle: true,
    ),
      body: Column(
        children: [
          Text('Main Scrin', style: TextStyle(color: Colors.white),),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/todo');
          }, child: Text("Перейти далее"))
        ],
      ),
    );
  }
}
