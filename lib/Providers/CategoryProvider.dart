import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/CustomNotification.dart';
import 'package:hat_bazar/Models/SubCategory.dart';
import 'package:uuid/uuid.dart';
import '../models/Category.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    getAllCategories();
  }

  TextEditingController categoryName = TextEditingController();
  TextEditingController subCategory = TextEditingController();
  final Uuid uuid = Uuid();
  final db = FirebaseFirestore.instance;

  List<SubCategory> subCategories = [];
  bool isLoading = false;
  List<Category> categories = [];

  Future<void> getAllCategories() async {
    isLoading = true;
    notifyListeners();
    
    categories.clear(); // Clear previous categories
    try {
      var categoryDocs = await db.collection("Categories").orderBy("id").get();
      categories = categoryDocs.docs.map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (ex) {
      print("Error fetching categories: $ex");
      print("Failed to fetch categories. Please try again.");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addCategoriesBulk(BuildContext context) async {
    if (categories.isEmpty) {
      errorMessage(context, "No categories to add.");
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      for (var category in categories) {
        await db.collection("Categories").doc(category.id).set(category.toJson());
        print("Category added: ${category.id}");
      }
      successMessage(context, "Categories added successfully");
    } catch (ex) {
      errorMessage(context, "Error adding categories: $ex");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addCategory(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    if (subCategories.isNotEmpty && categoryName.text.isNotEmpty) {
      String id = uuid.v4();
      Category newCategory = Category(
        id: id,
        title: categoryName.text,
        value: categoryName.text.toLowerCase().replaceAll(' ', '-'),
        subCategories: subCategories,
      );

      try {
        await db.collection("Categories").doc(id).set(newCategory.toJson());
        successMessage(context, "Category added successfully");
        categoryName.clear();
        subCategories.clear();
      } catch (ex) {
        errorMessage(context, "Error adding category: $ex");
      }
    } else {
      errorMessage(context, "Please add at least one subcategory and a category name.");
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
