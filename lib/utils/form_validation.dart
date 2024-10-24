class ItemValidators {
  static String? validateItemName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter item name';
    }
    return null;
  }

  static String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter price';
    }
    // Regular expression to match a positive floating point number
    final RegExp regex = RegExp(r'^\d+(\.\d+)?$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid price';
    }
    return null;
  }
}
