// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gingerit/model.dart';
import 'package:http/http.dart' as http;

class FetchData {
  final client = http.Client();

  late AppModel appModel;

  Future<AppModel> getData({context, required String text}) async {
    const String url = "https://coqvuc.deta.dev/gingerapp/";

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Gingering your text")));

    final Uri uri = Uri.parse(url + text);
    print(uri);

    final http.Response response = await client.get(uri);

    try {
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        final data = response.body;
        print(data);

        final parsedData = json.decode(data);
        String result = parsedData['result'];

        return appModel = AppModel(result);
      } else {
        return appModel = AppModel("Something went wrong");
      }
    } catch (e) {
      print(e);
      return appModel = AppModel("Something went wrong");
    }
  }
}
