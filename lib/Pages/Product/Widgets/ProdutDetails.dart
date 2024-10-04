// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hat_bazar/Providers/AddProductProvider.dart';
import 'package:hat_bazar/Widgets/MyDropDownMenu.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var category = [
      "Electronics",
      "Clothing",
      "Home & Garden",
      "Sports & Outdoors",
      "Beauty & Personal Care",
      "Kitchen & Dining",
    ];
    
    // Access the provider
    final addProductProvider = Provider.of<AddProductProvider>(context);
    
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.dashboard),
                        SizedBox(width: 10),
                        Text("Product Details"),
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Text("Active"),
                        Transform.scale(
                          scale: 0.5,
                          child: Switch(
                            value: addProductProvider.isActive, // Bind to provider
                            onChanged: (value) {
                              // Update provider state when switch is toggled
                              addProductProvider.isActive = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 1,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.5),
                ),
                SizedBox(height: 20),
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
                  controller: addProductProvider.productName, // Set controller from provider
                  decoration: InputDecoration(
                    hintText: 'Product Name...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
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
                  controller: addProductProvider.productDescription, // Set controller from provider
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
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
                    MyDropdownMenu(
                      items: category,
                      hintText: "Select a category",
                      valueChanged: (category) {
                        if (category != null) {
                          addProductProvider.selectedCategory = category;
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                    MyDropdownMenu(
                      items: category,
                      hintText: "Select a Subcategory",
                      valueChanged: (subCategory) {
                        if (category != null) {
                          addProductProvider.selectedSubCategory = subCategory;
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                  controller: addProductProvider.sellerName, // Set controller from provider
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
