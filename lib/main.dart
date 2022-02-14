// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int valor = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cargarPref();
  }

  _cargarPref() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      valor = pre.getInt("valor")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicación"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(valor.toString(), style: TextStyle(fontSize: 40)),
          ElevatedButton(
              child: Text("cambio"),
              onPressed: () async {
                SharedPreferences pre = await SharedPreferences.getInstance();

                setState(() {
                  valor = valor * 2;
                  pre.setInt("valor", valor);
                });
              })
        ],
      )),
    );
  }
}
