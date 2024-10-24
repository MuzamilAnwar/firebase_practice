import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/models/item_model.dart';
import 'package:practice/models/product_model.dart';
import 'package:practice/utils/text_editing_controllers.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../utils/select_image.dart';

class FirebaseService {
  static const uuid = Uuid();
  static FirebaseFirestore firebase = FirebaseFirestore.instance;

  static Future<String?> uploadImage(File imageFile) async {
    try {
      String imageName = DateTime.now().microsecondsSinceEpoch.toString();
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child(imageName);
      String contentType =
          imageFile.path.endsWith('.png') ? 'image/png' : 'image/.jpeg';
      await ref.putFile(imageFile,
          firebase_storage.SettableMetadata(contentType: contentType));
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> addItem() async {
    try {
      String? imageUrl = await uploadImage(Selectimage.imagefile!);
      Item item = Item(
        id: uuid.v4(),
        name: ItemController.itemNameController.text,
        price: double.parse(ItemController.itemPriceController.text),
        discountPrice:
            double.parse(ItemController.discountPriceController.text),
        description: ItemController.itemDescriptionController.text,
        imageUrl: imageUrl!,
        review: 1.0,
        category: ItemController.selectedvalue.toString(),
      );
      await firebase.collection('items').add(item.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  static Future addData(Product product) async {
    firebase.collection("data").add(product.toJson());
  }

  static Future<List<Product>> getProducts() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('data');

    QuerySnapshot snapshot = await products.get();

    return snapshot.docs.map((doc) {
      return Product.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }


  static Future<void> updateProduct(
      String productId, Product updatedProduct) async {
    firebase.collection('data').doc(productId).update(updatedProduct.toJson());
  }

  static Future<void> deleteProduct(String productId) async {
    firebase.collection('data').doc(productId).delete();
  }

}
