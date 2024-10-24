import 'package:flutter/material.dart';
import 'package:practice/auth/service/auth_service.dart';
import 'package:practice/models/product_model.dart';
import 'package:practice/services/add_item.dart';
import 'package:practice/view/all_data.dart';
import 'package:practice/widgets/custom_button_widget.dart';
import 'package:practice/widgets/custom_text_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  // For updating
  Product? selectedProduct;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await AuthService.logout();
            },
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AllData();
                },
              ));
            },
            icon: const Icon(Icons.skip_next_rounded),
          ),
        ],
        title: const Text("Add Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text field for item name
            AppTextField(
              hintText: "Item Name",
              controller: nameController,
            ),
            const SizedBox(height: 10),

            // Text field for item price
            AppTextField(
              hintText: "Item Price",
              controller: priceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // ADD/UPDATE BUTTON
            AppButton(
              text: selectedProduct == null ? "Add Item" : "Update Item",
              onPressed: () async {
                final name = nameController.text.trim();
                final price =
                    double.tryParse(priceController.text.trim()) ?? 0.0;

                if (selectedProduct == null) {
                  // Add new item
                  await FirebaseService.addData(
                    Product(id: '', name: name, price: price),
                  );
                } else {
                  // Update existing item
                  final updatedProduct = Product(
                    id: selectedProduct!.id,
                    name: name,
                    price: price,
                    isCompleted: selectedProduct!.isCompleted,
                  );
                  await FirebaseService.updateProduct(
                      selectedProduct!.id, updatedProduct);
                  setState(() {
                    selectedProduct = null;
                  });
                }

                nameController.clear();
                priceController.clear();
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('data').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final items = snapshot.data!.docs.map((doc) {
                    return Product.fromJson(
                        doc.data() as Map<String, dynamic>, doc.id);
                  }).toList();

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle:
                            Text('Price: ${item.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Edit button
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  selectedProduct = item;
                                  nameController.text = item.name;
                                  priceController.text = item.price.toString();
                                });
                              },
                            ),

                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                await FirebaseService.deleteProduct(item.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
