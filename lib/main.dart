import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _switchFlag = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              backWidget(),
              frontWidget(),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: Icon(
              Icons.add,
              size: 45,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerFloat // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget backWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.indigoAccent[400],
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      );

  Widget frontWidget() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 170),
              height: 160,
              width: 380,
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.2, // has the effect of extending the shadow
                  )
                ],
              ),
              child: doneTaskCardWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: switchWidget(),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return taskWidget();
                },
                itemCount: 8,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
          ],
        ),
      );

  Widget doneTaskCardWidget() => Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '本日のDone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigoAccent[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '32 ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Tasks',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget switchWidget() => Container(
        height: 70,
        child: GestureDetector(
          onTap: () {
            _changeSwitch();
          },
          child: FlareActor(
            "assets/done_switch.flr",
            animation: (_switchFlag ? "On" : "Off"),
            fit: BoxFit.cover,
          ),
        ),
      );

  void _changeSwitch() {
    print(_switchFlag);
    setState(() {
      if (_switchFlag) {
        _switchFlag = false;
      } else {
        _switchFlag = true;
      }
    });
  }

  Widget taskWidget() => Container(
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              blurRadius: 8.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
            )
          ],
        ),
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40, right: 30, left: 30),
                child: LinearProgressIndicator(
                  value: 0.3,
                  valueColor: AlwaysStoppedAnimation(Colors.indigoAccent[700]),
                  backgroundColor: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 30, right: 20),
                child: Text(
                  'React + TypeScriptを完璧にする（たぶん）',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
