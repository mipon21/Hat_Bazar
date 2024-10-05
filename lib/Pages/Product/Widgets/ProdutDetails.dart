import 'package:flutter/material.dart';
import 'package:hat_bazar/Models/SubCategory.dart';
import 'package:hat_bazar/Pages/Category/Widgets/CategoryDropDown.dart';
import 'package:hat_bazar/Pages/Category/Widgets/SubCategoryDropDown.dart';
import 'package:hat_bazar/Providers/AddProductProvider.dart';
import 'package:hat_bazar/Providers/CategoryProvider.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final subCategoryNotifier = ValueNotifier<List<SubCategory>>([]);
    // Access the provider
    final addProductProvider = Provider.of<AddProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final isDesktop = Responsivelayout.isDesktop(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                // Product Details Header and Switch
                Row(
                  mainAxisAlignment: isDesktop ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.dashboard),
                        SizedBox(width: 10),
                        Text("Product Details"),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (isDesktop)
                      Row(
                        children: [
                          Text("Active"),
                          Transform.scale(
                            scale: 0.5,
                            child: Switch(
                              value: addProductProvider
                                  .isActive, // Bind to provider
                              onChanged: (value) {
                                // Update provider state when switch is toggled
                                addProductProvider.isActive = value;
                              },
                            ),
                          ),
                        ],
                      )
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 1,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
                SizedBox(height: 20),

                // Product Name Field
                Row(
                  children: [
                    Text(
                      "Product Name",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addProductProvider
                      .productName, // Set controller from provider
                  decoration: InputDecoration(
                    hintText: 'Product Name...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Description Field
                Row(
                  children: [
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addProductProvider
                      .productDescription, // Set controller from provider
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Category Selection
                Row(
                  children: [
                    Text(
                      "Category",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Consumer<CategoryProvider>(
                      builder: (context, value, child) {
                        return CategorySearchDropdownMenu(
                          items: value.categories,
                          hintText: "Select a category",
                          valueChanged: (category) {
                            if (category != null) {
                              // Update subCategoryNotifier based on the selected category
                              subCategoryNotifier.value =
                                  category.subCategories!;
                              addProductProvider.selectedCategory =
                                  category.title!;

                              // Reset selected subcategory when category changes
                              addProductProvider.selectedSubCategory = "";
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Subcategory Selection
                Row(
                  children: [
                    Text(
                      "Sub Category",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ValueListenableBuilder<List<SubCategory>>(
                      valueListenable: subCategoryNotifier,
                      builder: (context, value, child) {
                        return SubCategorySearchDropdownMenu(
                          items: value,
                          hintText: "Select a subcategory",
                          valueChanged: (subcategory) {
                            if (subcategory != null) {
                              addProductProvider.selectedSubCategory =
                                  subcategory.title!;
                            }
                          },
                          selectedValue: addProductProvider.selectedSubCategory,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Seller Name Field
                Row(
                  children: [
                    Text(
                      "Seller Name",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addProductProvider
                      .sellerName, // Set controller from provider
                  decoration: InputDecoration(
                    hintText: 'Seller Name...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
