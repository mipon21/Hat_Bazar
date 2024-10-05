// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hat_bazar/Providers/CategoryProvider.dart';
import 'package:hat_bazar/Widgets/PrimaryBtn.dart';
import 'package:hat_bazar/Widgets/Rounded_Small_IconBtn.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Container(
      height: 640,
      width: 600,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.dashboard),
                SizedBox(width: 10),
                Text("Category Details"),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Category Name",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: categoryProvider.categoryName,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Enter Category Name...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sub Category List",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: categoryProvider.subCategory,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      categoryProvider.addSubCategory(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Sub Category...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                RoundedSmallIconbtn(
                  onTap: () {
                    categoryProvider
                        .addSubCategory(categoryProvider.subCategory.text);
                  },
                  icon: Icons.done,
                  color: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 20),
            Consumer<CategoryProvider>(builder: (context, value, child) {
              return value.subCategories.isEmpty
                  ? DottedBorder(
                      radius: Radius.circular(20),
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                      strokeWidth: 1,
                      dashPattern: [5, 7],
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.done_all),
                            SizedBox(width: 10),
                            Text(
                              "No Sub Category",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(),
                      constraints: BoxConstraints(maxHeight: 200),
                      child: SingleChildScrollView(
                        child: Column(
                          children: value.subCategories
                              .map((e) => ListTile(
                                    trailing: IconButton(
                                      onPressed: () {
                                        categoryProvider
                                            .removeSubCategory(e.id!);
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                    title: Text(e.title!),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
            }),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CategoryProvider>(builder: (context, vlaue, child) {
                  return vlaue.isLoading
                      ? CircularProgressIndicator()
                      : PrimaryBtn(
                          onTap: () {
                            categoryProvider.addCategory(context);
                          },
                          name: "Save",
                          icon: Icons.save,
                          color: Colors.green,
                        );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
