import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hat_bazar/Pages/Category/Widgets/CategoryDataTable.dart';
import 'package:hat_bazar/Widgets/PrimaryBtn.dart';
import 'package:hat_bazar/Widgets/Rounded_Small_IconBtn.dart';


class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text("Category Overview",
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
              onTap: () {
                context.push('/addCategory');
              },
              name: "Add New",
              icon: Icons.add,
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
        CategoryTableData()
      ],
    );
  }
}
