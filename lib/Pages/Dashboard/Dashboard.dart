import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Widgets/HomeStatics.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final statics = [
      {
        "icon": IconAssets.cart,
        "label": "Total Order",
        "value": "4567",
      },
      {
        "icon": IconAssets.refresh,
        "label": "Pending Order",
        "value": "2345",
      },
      {
        "icon": IconAssets.delivery,
        "label": "Processing Order",
        "value": "8788",
      },
      {
        "icon": IconAssets.done,
        "label": "Completed Order",
        "value": "3445",
      }
    ];

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 7,
              height: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Text("Dashboard", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: statics
              .map((e) => Expanded(
                    child: HomeStatics(
                      lable: e["label"]!,
                      value: e["value"]!,
                      icon: e["icon"]!,
                    ),
                  ))
              .toList(),
              
        ),
      ],
    );
  }
}
