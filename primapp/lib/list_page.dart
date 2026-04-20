// lib/list_page.dart
import 'package:flutter/material.dart';
import 'todo_state.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: TodoManager.todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(TodoManager.todos[index]),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                TodoManager.todos.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}