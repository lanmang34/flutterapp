import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/page/TipRoute.dart';

import 'page/NewRoute.dart';
import 'widget/RandomWidget.dart';

void main() {
  return runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Test app',
      initialRoute: 'home',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        'home': (context) => TestHomePage(title: 'test page'),
        'new page': (context) => NewRoute(),
        'tip route': (context) => TipRoute(content: ModalRoute.of(context).settings.arguments)
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {
            var routeName = settings.name;

          }
        );
      },
//      home: TestHomePage(title: 'Test Page'),
    );
  }

}

class TestHomePage extends StatefulWidget {

//  TestHomePage({Key key, this.title}): super(key: key);

  TestHomePage({this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _CreateTestHomePage();
}

class _CreateTestHomePage extends State<TestHomePage> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'line1'
              ),
              Text(
                '$count'
              ),
              FlatButton(
                child: Text('Start a new page'),
                textColor: Colors.red,
                onPressed: () {
//                Navigator.push(context, MaterialPageRoute(
//                  builder: (context) => NewRoute(),
//                  maintainState: false,
//                  fullscreenDialog: true
//                ));
                  Navigator.pushNamed(context, 'new page');
                },

              ),
              FlatButton(
                child: Text('start tip route'),
                textColor: Colors.blue,
                onPressed: () async {
//                var result = await Navigator.push(context, MaterialPageRoute(
//                  builder: (context) => TipRoute(content: '我是参数'),
//                ));
                var result = await Navigator.pushNamed(context, 'tip route', arguments: 'lalala');
                  print('result is $result');
                },
              ),
              RandomWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  void _add() {
    setState(() {
      count++;
    });
  }

}

