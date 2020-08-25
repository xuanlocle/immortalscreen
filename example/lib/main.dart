import 'package:flutter/material.dart';
import 'dart:async';
import 'package:immortalscreen/immortalscreen.dart';
import 'package:rxdart/subjects.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<bool> controllerScreenOn = BehaviorSubject();

  @override
  void initState() {
    super.initState();
    controllerScreenOn = new StreamController();
    Immortalscreen.setScreenAlwaysOn;
  }

  @override
  void dispose() {
    super.dispose();
    controllerScreenOn.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text('Immortal Screen'),
            ),
            body: Stack(children: <Widget>[
              Positioned(
                  left: 200,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: StreamBuilder(
                      stream: controllerScreenOn.stream,
                      builder: (context, snapshot) {
                        bool status = true;
                        if (snapshot.hasData) status = snapshot.data;
                        return Container(
                            color: status ? Colors.orange : Colors.grey);
                      })),
              Container(
                  alignment: Alignment.center,
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Ink(
                        color: Colors.orange,
                        width: double.infinity,
                        child: InkWell(
                            splashColor: Colors.orangeAccent,
                            onTap: () {
                              Immortalscreen.setScreenAlwaysOn;
                              controllerScreenOn.add(true);
                            },
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(20.0),
                                child: Text("Enable screen on",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))))),
                    SizedBox(height: 10.0),
                    Ink(
                        color: Colors.grey,
                        width: double.infinity,
                        child: InkWell(
                            onTap: () {
                              Immortalscreen.resetScreenAlwaysOn;
                              controllerScreenOn.add(false);
                            },
                            child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Text("Disable screen on",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)))))
                  ]))
            ])));
  }
}
