import 'dart:convert';

import 'package:ekyc/ekyc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomePage(
        key: Key('home_page'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _platformVersion = 'EKYC';
  final _ekycPlugin = Ekyc();
  String? _resultImg;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Xác thực thực thể EKYC')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Running on: $_platformVersion\n'),
            Center(
              child: TextButton(
                onPressed: () async {
                  _resultImg = await _ekycPlugin.gotoEKYC();
                  setState(() {});
                },
                child: const Text('Start Ekyc'),
              ),
            ),
            if (_resultImg != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.memory(
                  base64Decode(_resultImg!),
                  height: 200,
                  width: 200,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
