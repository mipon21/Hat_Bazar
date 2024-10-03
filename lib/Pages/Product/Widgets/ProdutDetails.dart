// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hat_bazar/Widgets/MyDropDownMenu.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

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
                  children: [
                    Icon(Icons.dashboard),
                    SizedBox(width: 10),
                    Text("Product Details")
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 1,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
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
                  decoration: InputDecoration(
                    hintText: 'Product Name...',
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
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description...',
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
                        valueChanged: (value){}),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "SubCategory",
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
                        valueChanged: (value){}),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Active",),
                    Transform.scale(
                      scale: 0.5,
                      child: Switch(value: true, onChanged: (value){}),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
