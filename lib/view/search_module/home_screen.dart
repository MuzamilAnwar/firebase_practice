import 'package:flutter/material.dart';
import 'package:practice/services/list_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ListService.filterList.addAll(ListService.names);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          controller: ListService.searchController,
          onChanged: (value) {
            setState(() {
              ListService.getdata(value);
            });
          },
        ),
        Expanded(
            child: ListView.builder(
          itemCount: ListService.filterList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(ListService.filterList[index]),
            );
          },
        ))
      ],
    ));
  }
}
