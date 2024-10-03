import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hat_bazar/Providers/AddProductProvider.dart';
import 'package:provider/provider.dart';

class ProductAmount extends StatelessWidget {
  const ProductAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addProductProvider = Provider.of<AddProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.money_outlined),
                  SizedBox(width: 10),
                  Text("Amount"),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Purchase Price",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: addProductProvider.productPurchasePrice,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(
                                hintText: "Amount....",
                                border: OutlineInputBorder(),
                                ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Sell Price",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: addProductProvider.productSellPrice,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: "Amount....",   
                              border: OutlineInputBorder()),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Discount",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: addProductProvider.productDiscountPrice,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: "Amount....",
                              border: OutlineInputBorder()),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Tags",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addProductProvider.productTags,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter Tags",
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
