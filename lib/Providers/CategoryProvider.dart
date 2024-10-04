import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/CustomNotification.dart';
import 'package:hat_bazar/Models/SubCategory.dart';
import 'package:uuid/uuid.dart';
import '../models/Category.dart';

class CategoryProvider extends ChangeNotifier {
  TextEditingController categoryName = TextEditingController();
  TextEditingController subCategory = TextEditingController();
  final Uuid uuid = Uuid();
  final db = FirebaseFirestore.instance;

  List<SubCategory> subCategories = [];
  bool isLoading = false;

  Future<void> addCategory(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (subCategories.isNotEmpty || categoryName.text.isNotEmpty) {
      String id = uuid.v4();
      Category newCategory = Category(
        id: id,
        title: categoryName.text,
        value: categoryName.text.toLowerCase().replaceAll(' ', '-'),
        subCategories: subCategories,
      );
      try {
        await db.collection("Categories").doc(id).set(newCategory.toJson());
      } catch (ex) {}
      successMessage(context, "Category added successfully");
    } else {
      errorMessage(context, "Please add at least one sub category");
    }
    isLoading = false;
    notifyListeners();
  }

  void addSubCategory(String subCategoryName) {
    if (subCategoryName.isNotEmpty) {
      subCategories.add(SubCategory(
        id: uuid.v4(),
        title: subCategoryName,
        value: subCategoryName.toLowerCase().replaceAll(' ', '-'),
      ));
      subCategory.clear();
      notifyListeners();
    }
  }

  void removeSubCategory(String id) {
    subCategories.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
