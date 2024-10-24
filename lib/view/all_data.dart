import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/product_model.dart';
import 'package:practice/services/add_item.dart';

class AllData extends StatelessWidget {
  const AllData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Data"),
      ),
      body: Column(
        children: [
          StreamBuilder(stream: FirebaseFirestore.instance.collection("data").snapshots(), builder: (context, snapshot) {
            final item=snapshot.data!.docs.map((e) => Product.fromJson(e.data() as Map<String, dynamic>, e.id),).toList();


            return ListView.builder(itemBuilder: (context, index) {
              return Text(item[index].name);
            },);
          },),
          FutureBuilder(
            future: FirebaseService.getProducts(),
            builder: (context, snapshot) {
              final data = snapshot.data;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].name),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
