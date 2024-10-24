import 'package:flutter/material.dart';

class ItemController {
  static final TextEditingController itemNameController =
      TextEditingController();
  static final TextEditingController itemDescriptionController =
      TextEditingController();
  static final TextEditingController itemPriceController =
      TextEditingController();
  static final TextEditingController discountPriceController =
      TextEditingController();
  static String? selectedvalue;
}
