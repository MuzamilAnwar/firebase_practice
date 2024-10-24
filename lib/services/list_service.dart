import 'package:flutter/material.dart';

class ListService {
  static List<String> filterList = [];
  static final TextEditingController searchController = TextEditingController();
  static List<String> names = ['waqas', 'zaffar', 'hamid', 'azaam', 'amir'];

  static getdata(String query) async {
    filterList = names
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
