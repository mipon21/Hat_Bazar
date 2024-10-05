// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hat_bazar/Config/CustomNotification.dart';
import 'package:hat_bazar/Config/PageRoutes.dart';
import 'package:hat_bazar/Pages/Category/Widgets/CategoryDetails.dart';
import 'package:hat_bazar/Pages/Product/Widgets/MetaDetails.dart';
import 'package:hat_bazar/Pages/Product/Widgets/ProductAmountDetails.dart';
import 'package:hat_bazar/Pages/Product/Widgets/ProdutDetails.dart';
import 'package:hat_bazar/Providers/AddProductProvider.dart';
import 'package:hat_bazar/Providers/CategoryProvider.dart';
import 'package:hat_bazar/Widgets/PrimaryBtn.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final _stringTagController = StringTagController();
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            }),
        actions: [
          PrimaryBtn(
              onTap: () {
                context.pop();
              },
              name: "Close",
              icon: Icons.close,
              color: Colors.red),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    children: [CategoryDetails()],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
