import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items =
      List<String>.generate(30, (index) => "Items ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Swipe to dismiss",
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(
              items[index],
            ),
            onDismissed: (direction) => {
              items.removeAt(index),
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Item deleted",
                  ),
                ),
              ),
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text(
                "${items[index]}",
              ),
            ),
          );
        },
      ),
    );
  }
}
