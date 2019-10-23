import 'package:flutter/material.dart';
import '../global_config.dart';

/// 通知
///
/// @date 2019/10/22
/// @since 1.0.0
/// @version code 1
/// @author nan
class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NoticeState();
  }
}

class _NoticeState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('通知'),
        ),
        body: new Center(
          child: null,
        ),
      ),
      theme: GlobalConfig.themeData,
    );
  }
}
