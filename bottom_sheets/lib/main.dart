import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() => {
          _showPersBottomSheetCallBack = null,
        });

    scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: 300,
            color: Colors.green,
            child: Center(
              child: Text(
                "Hi Bottomsheet",
              ),
            ),
          );
        })
        .closed
        .whenComplete(
          () {
            if (mounted) {
              setState(() {
                _showPersBottomSheetCallBack = _showBottomSheet;
              });
            }
          },
        );
  }

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          color: Colors.green,
          child: Center(
            child: Text(
              "Hi Modal Sheet",
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Flutter BottomSheets",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _showPersBottomSheetCallBack,
                child: Text(
                  "Persistent",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              RaisedButton(
                onPressed: _showModalSheet,
                child: Text(
                  "Modal",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
