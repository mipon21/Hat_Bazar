// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hat_bazar/Config/CustomNotification.dart';
import 'package:hat_bazar/Config/PageRoutes.dart';
import 'package:hat_bazar/Pages/Product/Widgets/MetaDetails.dart';
import 'package:hat_bazar/Pages/Product/Widgets/ProductAmountDetails.dart';
import 'package:hat_bazar/Pages/Product/Widgets/ProdutDetails.dart';
import 'package:hat_bazar/Providers/AddProductProvider.dart';
import 'package:hat_bazar/Widgets/PrimaryBtn.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final _stringTagController = StringTagController();
    final addProductProvider = Provider.of<AddProductProvider>(context);
    final isDesktop = Responsivelayout.isDesktop(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: isDesktop?Text("Add Product"):SizedBox(),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            }),
        actions: [
          if (isDesktop)
            Consumer<AddProductProvider>(builder: (context, value, child) {
              if (value.isLoading) {
                return CircularProgressIndicator();
              }
              return PrimaryBtn(
                  onTap: () {
                    addProductProvider.addProduct();
                  },
                  name: "Save",
                  icon: Icons.save,
                  color: Theme.of(context).colorScheme.primary);
            }),
          SizedBox(
            width: 10,
          ),
          if (isDesktop)
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
          if (!isDesktop)
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
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          children: [ProductDetails()],
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          children: [MetaDetails()],
                        )),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [ProductDetails()],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [MetaDetails()],
                        ),
                      ],
                    ),
              SizedBox(
                height: 10,
              ),
              ProductAmount(),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    Consumer<AddProductProvider>(
                        builder: (context, value, child) {
                      if (value.isLoading) {
                        return CircularProgressIndicator();
                      }
                      return PrimaryBtn(
                          onTap: () {
                            addProductProvider.addProduct();
                          },
                          name: "Save",
                          icon: Icons.save,
                          color: Theme.of(context).colorScheme.primary);
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
