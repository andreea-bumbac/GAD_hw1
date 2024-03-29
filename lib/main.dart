import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'Currency convertor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = "";
  String _mesaj = "";

  final TextEditingController nrController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      if (nrController.text.isEmpty) {
        _mesaj = "please enter a number";
        _text = "";
      } else {
        _mesaj = "";
        var result = (double.parse(nrController.text) * 4.85).toStringAsFixed(
            2);
        _text = result.toString()  + ' Ron';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text(widget.title)),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/lei.jpg'),
            TextFormField(
              controller: nrController,
                keyboardType: TextInputType.number, decoration: const InputDecoration(
                hintText: 'Enter the amount in EUR'),


            ),

            Text(
              _mesaj,
              style: TextStyle(color:Colors.red)
            ),
            TextButton(
              onPressed: _incrementCounter,

              child: const Text("CONVERT"),),

            Text(
                _text,
                style: TextStyle(fontSize: 25)

            ),

          ],
        ),
      ),

      );
  }
}
