import 'package:flutter/material.dart';
import 'package:mina/todocard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

//class for Task(Todocard)
class Task {
  String titel;
  bool stetus;

  Task({
    required this.titel,
    required this.stetus,
  });
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List allTask = [
    Task(titel: 'u take mony', stetus: true),
    Task(titel: 'ar u happy now', stetus: true),
    Task(titel: 'okk goo enjoy now', stetus: false),
    Task(titel: 'we  need  make new dael', stetus: true),
    Task(titel: 'we  need  make new dael', stetus: true),
    Task(titel: 'we  need  make new dael', stetus: true),
  ];

 //To Rmove todo wehn clickng on 'delete' icon
  delete(int clickedTask) {
    setState(() {
      allTask.remove(allTask[clickedTask]);
    });
  }
//To remove all todo when clickng on 'delete' icon in the app
  deleteAll() {
    setState(() {
      allTask.removeRange(0, 6);
    });
  }
// to change the Status of the todo (complet or not complet) we clicke todo
  changeStatus(int taskIndex) {
    setState(() {
      allTask[taskIndex].stetus = !allTask[taskIndex].stetus;
    });
  }
// to add new todo when clicking on 'add' in the dilog widget
  addNewTask() {
    setState(() {
      allTask.add(
        Task(titel: myController.text, stetus: true),
      );
    });
  }

//Create controller to get the tex insied the texfield
  final myController = TextEditingController();

//cluclet only Complet todos
  int clucletCompletTask() {
    int completdTask = 0;

    allTask.forEach((item) {
      if (item.stetus) {
        completdTask++;
      }
    });

    return completdTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        TextField(
                          controller: myController,
                          maxLength: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            addNewTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    height: 200,
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(55, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(
                Icons.delete_forever,
              )),
        ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(55, 66, 86, 1),
        title: Text(
          'Todoo',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                '${clucletCompletTask()}/${allTask.length}',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            Container(
              height: 600,
              child: ListView.builder(
                  itemCount: allTask.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todocard(
                        vartitle: allTask[index].titel,
                        yesORno: allTask[index].stetus,
                        myfunc: changeStatus,
                        iii: index,
                        delete: delete);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
