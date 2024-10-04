import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hat_bazar/Models/Product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddProductProvider extends ChangeNotifier {
  final ImagePicker imagePicker = ImagePicker();
  List<Uint8List> images = [];
  TextEditingController productName = TextEditingController();
  TextEditingController sellerName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPurchasePrice = TextEditingController();
  TextEditingController productSellPrice = TextEditingController();
  TextEditingController productDiscountPrice = TextEditingController();
  TextEditingController productStock = TextEditingController();
  TextEditingController productTags = TextEditingController();

  final FirebaseStorage db = FirebaseStorage.instance;
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final uuid = Uuid();

  String selectedCategory = "";
  String selectedSubCategory = "";
  String selectedUnitType = "";
  String selectedUnit = "";
  bool isLoading = false;

  // Add the active state
  bool _isActive = true;

  // Getter for the active state
  bool get isActive => _isActive;

  // Setter for the active state
  set isActive(bool value) {
    _isActive = value;
    notifyListeners();
  }

  void printProductsDetails() {
    print("Product Name: ${productName.text}");
    print("Product Description: ${productDescription.text}");
    print("Product Purchase Price: ${productPurchasePrice.text}");
    print("Product Sell Price: ${productSellPrice.text}");
    print("Product Discount Price: ${productDiscountPrice.text}");
    print("Product Stock: ${productStock.text}");
    print("Product Tags: ${productTags.text}");
    print("Seller Name: ${sellerName.text}");
    print("Selected Category: ${selectedCategory}");
    print("Selected Subcategory: ${selectedSubCategory}");
    print("Selected Unit Type: ${selectedUnitType}");
    print("Selected Unit: ${selectedUnit}");
    print("Is Active: $_isActive"); // Add this line to print active state
    print("Images: ${images}");
  }

  Future<void> addProduct() async {
    isLoading = true;
    notifyListeners();
    String productId = uuid.v4();
    List<String> imageUrls = await uploadImage(images, "products");
    Product newProduct = Product(
      id: productId,
      name: productName.text,
      description: productDescription.text,
      purchasePrice: double.parse(productPurchasePrice.text),
      sellPrice: double.parse(productSellPrice.text),
      discount: double.parse(productDiscountPrice.text),
      stock: double.parse(productStock.text),
      supplier: sellerName.text,
      category: selectedCategory,
      subCategory: selectedSubCategory,
      unitType: selectedUnitType,
      unit: selectedUnit,
      images: imageUrls,
      averageRating: 0,
      isActive: _isActive,  // Include isActive in the product data
    );
    try {
      await database.collection("products").doc(productId).set(newProduct.toJson());
      print("Product added successfully");
      clearProductDetails();

    } catch (e) {
      print("Failed to add product: $e");
    }
    isLoading = false;
    notifyListeners();
  }

  void clearProductDetails() {
    productName.clear();
    productDescription.clear();
    productPurchasePrice.clear();
    productSellPrice.clear();
    productDiscountPrice.clear();
    images.clear(); 
    productStock.clear();
    productTags.clear();
    selectedCategory = "";
    sellerName.clear();
    selectedSubCategory = "";
    selectedUnitType = "";
    selectedUnit = "";
    _isActive = true;  // Reset the active state
    notifyListeners();
  }

  Future<List<String>> uploadImage(List<Uint8List> images, String folderName) async {
    List<String> imageUrls = [];

    for (var image in images) {
      String imageId = "${uuid.v4()}.jpg";

      var imageRef = db.ref(folderName);

      try {
        await imageRef.child(imageId).putData(image);
        String downloadUrl = await imageRef.child(imageId).getDownloadURL();
        imageUrls.add(downloadUrl);
        print("Image uploaded successfully: $downloadUrl");
      } catch (e) {
        print("Failed to upload image: $e");
      }
    }
    return imageUrls;
  }

  void addImage(Uint8List imageData) {
    if (images.length < 6) {
      images.add(imageData);
      notifyListeners();
    }
  }

  void removeImage(Uint8List imageData) {
    images.remove(imageData);
    notifyListeners();
  }

  Future<void> pickImage() async {
    if (images.length < 6) {
      var response = await imagePicker.pickImage(source: ImageSource.gallery);
      print(response?.path);

      if (response != null) {
        var imageData = await response.readAsBytes();
        addImage(imageData);
      }
    }
    notifyListeners();
  }
}
