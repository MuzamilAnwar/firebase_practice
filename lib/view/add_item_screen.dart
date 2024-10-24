import 'package:flutter/material.dart';
import 'package:practice/utils/colors.dart';
import 'package:practice/utils/select_image.dart';
import 'package:practice/utils/text_editing_controllers.dart';
import 'package:practice/utils/form_validation.dart';
import 'package:practice/widgets/custom_appbar_widget.dart';
import 'package:practice/widgets/custom_button_widget.dart';
import 'package:practice/widgets/custom_drop_down_widget.dart';
import 'package:practice/widgets/custom_scaffold_messanger_widget.dart';
import 'package:practice/widgets/custom_text_field_widget.dart';
import '../services/add_item.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbarwidget(
        text: "Add Items",
        bgcolore: colors.appbarcolor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppTextField(
                  controller: ItemController.itemNameController,
                  labelText: 'Item Name',
                  validator: ItemValidators.validateItemName,
                ),
                const SizedBox(height: 10),
                CustomDropdownField(
                  value: ItemController.selectedvalue,
                  onChanged: (value) {
                    // You can update selected value in the controller here
                  },
                  labelText: 'Select Category',
                  items: const ['Food', 'Clothes', 'Weddings'],
                  validator: ItemValidators.validateCategory,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: ItemController.itemDescriptionController,
                  labelText: 'Item description',
                  validator: ItemValidators.validateItemName,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: ItemController.itemPriceController,
                  labelText: 'Item price',
                  validator: ItemValidators.validatePrice,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: ItemController.discountPriceController,
                  labelText: 'Discount price',
                  validator: ItemValidators.validatePrice,
                ),
                const SizedBox(height: 10),
                AppButton(
                  text: 'Select image',
                  onPressed: () {
                    Selectimage.pickimage();
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Selectimage.imagefile == null
                      ? const Center(child: Text('No image selected'))
                      : Image.file(Selectimage.imagefile!),
                ),
                AppButton(
                  text: 'Add Item',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseService.addItem().whenComplete(
                          () => Customscaffoldmessanger.showmessage('addes'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
