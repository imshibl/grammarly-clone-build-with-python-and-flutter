// ignore_for_file:avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:gingerit/notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppNotifier>(
          create: (_) => AppNotifier(),
        ),
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    final _resultController = TextEditingController();
    String userText = "";
    bool isLoading = false;

    final data = Provider.of<AppNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ginger It"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
              child: TextField(
                onChanged: (text) {
                  userText = text;
                },
                controller: _textController,
                minLines: 1,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () async {
              await data.fetchData(context, userText);
              _resultController.text = data.appModel.text;

              print(data.appModel.text);
            },
            color: Colors.blue,
            child: Text(
              "Correct It",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _resultController,
                minLines: 1,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
