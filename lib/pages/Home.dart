import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDo = "";
  List todo_list = [];

  @override
  void initState() {
    super.initState();

    todo_list.addAll(["Лаба по программированию", "дз теорвер"]);
  }

  void _menuOpen(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('Menu'),),
          body: Row(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, child: Text('На главную')),
              Padding(padding: EdgeInsets.only(left: 15)),
              Text('Наше простое меню')
            ],
          ),
        );
      })

    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Список дел"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _menuOpen();
              }
            ),
          ],
        ),
      body: ListView.builder(
        itemCount: todo_list.length,
          itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todo_list[index]),
              child: Card(
                child: ListTile(
                    title: Text(todo_list[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                      color: Colors.deepOrangeAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        todo_list.removeAt(index);
                      });
                    },
                  ),
                ),

              ),
            onDismissed: (direction) {
                setState(() {
                  todo_list.removeAt(index);
                });
            },
          );
          }
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
                    setState(() {
                      todo_list.add(_userToDo);
                    });
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
