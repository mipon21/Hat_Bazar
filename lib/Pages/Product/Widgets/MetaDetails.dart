// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hat_bazar/Const/Value.dart';
import 'package:hat_bazar/Widgets/HoverEffect.dart';
import 'package:hat_bazar/Widgets/MyDropDownMenu.dart';

class MetaDetails extends StatelessWidget {
  const MetaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var unitTypes = [
      "Piece",
      "Length",
      "Weight",
      "Volume",
      "Area",
      "Count/Quantity",
      "Mass",
    ];
    var unitNames = [
    // Length
    "Millimeters (mm)",
    "Centimeters (cm)",
    "Meters (m)",
    "Inches (in)",
    "Feet (ft)",
    
    // Weight
    "Grams (g)",
    "Kilograms (kg)",
    "Pounds (lbs)",
    "Ounces (oz)",
    
    // Volume
    "Milliliters (ml)",
    "Liters (l)",
    "Fluid Ounces (fl oz)",
    "Gallons (gal)",
    
    // Area
    "Square Millimeters (mm²)",
    "Square Centimeters (cm²)",
    "Square Meters (m²)",
    "Square Inches (in²)",
    "Square Feet (ft²)",
    
    // Count/Quantity
    "Units (pcs)",
    "Sets",
    "Bundles",
    
    // Mass
    "Grams (g)",
    "Kilograms (kg)",
    "Metric Tons (t)"
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
                    Icon(Icons.edit_document),
                    SizedBox(width: 10),
                    Text("Meta Details")
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
                      "Product Images",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: (){},
                  child: DottedBorder(
                    radius: Radius.circular(10),
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5),
                    strokeWidth: 1,
                    dashPattern: [5, 7],
                    child: HoverEffect(
                      builder: (isHover) => AnimatedContainer(
                      decoration: BoxDecoration(
                        color: isHover ? Theme.of(context).colorScheme.background.withOpacity(0.5)
                                       : Colors.transparent
                      ),  
                      duration: DefaultValue.animationDuration,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Click here to Upload Image",
                                style: Theme.of(context).textTheme.labelLarge,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                 ) 
                ),
                SizedBox(height: 10),
                DottedBorder(
                  radius: Radius.circular(10),
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                  strokeWidth: 1,
                  dashPattern: [5, 7],
                  child: Container(
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No image",
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Stock",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Stock...."),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch, 
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Unit Type:",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        MyDropdownMenu(
                            items: unitTypes,
                            hintText: "Select Unit Type",
                            valueChanged: (value) {}),
                      ],
                    )),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,  
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Unit Name:",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        MyDropdownMenu(
                            items: unitNames,
                            hintText: "Select Unit Name",
                            valueChanged: (value) {}),
                      ],
                    )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
