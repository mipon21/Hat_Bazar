import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Widgets/HomeStatics.dart';
import 'package:hat_bazar/Widgets/OrderHistory.dart';
import 'package:hat_bazar/Widgets/PrimaryBtn.dart';
import 'package:hat_bazar/Widgets/Rounded_Small_IconBtn.dart';

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
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  Text("Dashboard Overview",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundedSmallIconbtn(
              onTap: () {},
              icon: Icons.refresh,
              color: Colors.orange,
            ),
            SizedBox(
              width: 10,
            ),
            PrimaryBtn(
              onTap: () {},
              name: "Export",
              icon: Icons.import_export_sharp,
              color: Colors.deepPurple,
            ),
            SizedBox(
              width: 10,
            ),
            PrimaryBtn(
              onTap: () {},
              name: "Import",
              icon: Icons.download,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        OrderHistory(),
      ],
    );
  }
}
