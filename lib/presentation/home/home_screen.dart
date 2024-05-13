import 'package:api_login/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Create"),
                  ),
                ],
                content: SizedBox(
                  height: height * .2,
                  child: const Column(
                    children: [
                      TextField(),
                      TextField(),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'ToDo list',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return SizedBox(
              height: height * .11,
              width: double.infinity,
              child: const Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "disc",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
