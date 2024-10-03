import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ProductAmount extends StatelessWidget {
  const ProductAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: "Amount...."),
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
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: "Amount...."),
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
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: "Amount...."),
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
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter Tags",
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
