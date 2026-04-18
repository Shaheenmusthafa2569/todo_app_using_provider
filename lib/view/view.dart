import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/controller/controller.dart';

class Viewpage extends StatelessWidget {
  Viewpage({super.key});
  TextEditingController titletextcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskwatch = context.watch<Controller>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime.shade400,
        title: Text(
          "To-Do List",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Icon(Icons.keyboard_control_sharp, color: Colors.black, size: 30),
          SizedBox(width: 13),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.lime.shade300, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: titletextcont,
                      decoration: InputDecoration(
                        fillColor: Colors.lime.shade300,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (titletextcont.text.isNotEmpty) {
                        context.read<Controller>().addTask(
                          "${titletextcont.text}",
                        );
                        titletextcont.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lime.shade200,
                      surfaceTintColor: Colors.lime,
                    ),
                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskwatch.tasks.length,
                itemBuilder: (context, index) {
                  final todo = taskwatch.tasks[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        context.read<Controller>().toggleDonee(todo);
                      },
                    ),
                    trailing: IconButton(onPressed: () {
                      context.read<Controller>().toggledelete(todo);
                    }, icon: Icon(Icons.delete_outline_outlined))
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
