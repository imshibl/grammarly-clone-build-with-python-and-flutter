import 'package:flutter/material.dart';
import 'package:gingerit/api.dart';
import 'package:gingerit/model.dart';

class AppNotifier extends ChangeNotifier {
  final FetchData _fetchData = FetchData();
  late AppModel appModel;

  fetchData(context, String text) async {
    appModel = await _fetchData.getData(context: context, text: text);
    notifyListeners();
  }
}
