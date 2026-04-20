// lib/input_page.dart
import 'package:flutter/material.dart';
import 'todo_state.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _controller = TextEditingController();

  void _saveTodo() {
    if (_controller.text.isNotEmpty) {
      TodoManager.todos.add(_controller.text);
      _controller.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todo aggiunta!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Cosa devi fare?'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _saveTodo, child: const Text('Aggiungi')),
        ],
      ),
    );
  }
}