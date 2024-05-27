import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _LoginPage();
}

class _LoginPage extends State<MyHomePage> {
  late TextEditingController _login;
  late TextEditingController _password;
  String imageSource = 'images/question-mark.jpeg';

  void _loginScreen() {
    setState(() {
      if (_password.text == 'QWERTY123') {
        imageSource = 'images/idea.png';
      } else {
        imageSource = 'images/stop.png';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _login = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose(){

  _login.dispose();
  _password.dispose();
  super.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _login,
                  decoration: InputDecoration(labelText: 'Login', labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
            ),
        TextField(
          controller: _password,
          decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
            obscureText: true,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: _loginScreen,
          child: Text('Login'),
        ),
            SizedBox(height: 10,),
            Image.asset(imageSource,
            width: 300,
              height:300,)

          ],
        ),
      ),
    );
  }
}