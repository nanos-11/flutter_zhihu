import 'package:flutter/material.dart';
import '../global_config.dart';

class IdeaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _IdeaState();
  }
}

class _IdeaState extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('想法'),
        ),
        body: new Center(
          child: null,
        ),
      ),
      theme: GlobalConfig.themeData,
    );
  }
}
