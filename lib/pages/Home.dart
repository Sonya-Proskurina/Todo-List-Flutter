import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDo = "";

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Список дел"),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
      body: StreamBuilder (
          stream: FirebaseFirestore.instance.collection('items').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return Text("Нет записей");
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(snapshot.data!.docs[index].id),
                    child: Card (
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index].get('item')),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_sweep,
                            color: Colors.deepOrangeAccent,
                          ),
                          onPressed: () {
                            FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();

                          },
                        ),
                      ),

                    ),
                    onDismissed: (direction) {
                      FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                    },
                  );
                }
            );
          },

    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Добавить эллемент'),
              content: TextField(
                onChanged: (String value) {
                  setState(() {
                    _userToDo = value;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red, width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepOrangeAccent, width: 3.0),
                  ),
                  hintText: "Введите задачу",
                ),
                cursorColor: Colors.deepOrangeAccent,
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("items").add({'item': _userToDo});
                    Navigator.of(context).pop();
                  },
                  child: Text("Добавить"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                  ),
                )
              ],
            );
          }
          );
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(
          Icons.add_box,
          color: Colors.white
        ),
      ),
    )
    );
  }
}
