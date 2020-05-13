import 'package:flutter/material.dart';
import 'package:flutterprovider/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider 로 Material App 을 감싸서 BLoC 제공
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => Counter(),
          )
        ],
        child: Consumer<Counter>(builder: (context, counter, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(),
          );
        }));
  }
}

// Provider 를 사용하면 StatelessWidget 이어도 괜찮다.
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Provider 에서 counter 를 획득
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter app with Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
