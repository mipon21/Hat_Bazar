import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider extends ChangeNotifier {
  final ImagePicker imagePicker = ImagePicker();
  List<String> images = [];
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPurchasePrice = TextEditingController();
  TextEditingController productSellPrice = TextEditingController();
  TextEditingController productDiscountPrice = TextEditingController();
  TextEditingController productStock = TextEditingController();
  TextEditingController productTags = TextEditingController();

  String selectedCategory = "";
  String selectedSubCategory = "";
  String selectedUnitType = "";
  String selectedUnit = "";


  void printProductsDetails() {
    print("Product Name: ${productName.text}");
    print("Product Description: ${productDescription.text}");
    print("Product Purchase Price: ${productPurchasePrice.text}");
    print("Product Sell Price: ${productSellPrice.text}");
    print("Product Discount Price: ${productDiscountPrice.text}");
    print("Product Stock: ${productStock.text}");
    print("Product Tags: ${productTags.text}");
    print("Selected Category: ${selectedCategory}");
    print("Selected Subcategory: ${selectedSubCategory}");
    print("Selected Unit Type: ${selectedUnitType}");
    print("Selected Unit: ${selectedUnit}");
    print("Images: ${images.join(', ')}");
  }





  void addImage(String url) {
    if (images.length < 6) {
      images.add(url);
      notifyListeners();
    }
  }

  void removeImage(String url) {
    images.remove(url);
    notifyListeners();
  }

  Future<void> pickImage() async {
    if (images.length < 6) {
      var response = await imagePicker.pickImage(source: ImageSource.gallery);
      print(response?.path);
      if (response != null) {
        images.add(response.path);
      }
    }
    notifyListeners();
  }
}
