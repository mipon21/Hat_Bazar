// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Config/Colors.dart';
import 'package:hat_bazar/Const/ProductData.dart';
import 'package:hat_bazar/Models/Category.dart';
import 'package:hat_bazar/Widgets/Rounded_Small_IconBtn.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CategoryTableData extends StatelessWidget {
  const CategoryTableData({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryDataSource = CategoryDataSource(categoryData);
    return Container(
      height: 600,
      width: 1200,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SfDataGrid(
        rowHeight: 150,
        source: categoryDataSource,
        allowFiltering: true,
        allowSorting: true,
        headerGridLinesVisibility: GridLinesVisibility.none,
        gridLinesVisibility: GridLinesVisibility.none,
        columns: [
          GridColumn(
            allowFiltering: false,
            width: 150,
            columnName: "id",
            label: Center(child: Text("ID")),
          ),
          GridColumn(
            allowFiltering: false,
            width: 200,
            columnName: "images",
            label: Center(child: Text("IMAGE")),
          ),
          GridColumn(
            allowFiltering: false,
            width: 250,
            columnName: "title",
            label: Center(child: Text("CATEGORY NAME")),
          ),
          GridColumn(
            allowFiltering: false,
            width: 400,
            columnName: "subCategories",
            label: Center(child: Text("SUB-CATEGORY NAME")),
          ),
          GridColumn(
            allowSorting: false,
            allowFiltering: false,
            width: 150,
            columnName: "action",
            label: Center(child: Text("ACTION")),
          ),
        ],
      ),
    );
  }
}

class CategoryDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;

  CategoryDataSource(List<Category> categories) {
    dataGridRows = categories.map<DataGridRow>((category) {
      return DataGridRow(cells: [
        DataGridCell(columnName: "id", value: category.id),
        DataGridCell(columnName: "images", value: category.coverUrl),
        DataGridCell(columnName: "title", value: category.title),
        DataGridCell(
          columnName: "subCategories",
          value: category.subCategories != null
              ? category.subCategories!.map((subCat) => subCat.title).join(', ')
              : 'N/A',
        ),
        DataGridCell(columnName: "action", value: category.id),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        if (cell.columnName == "images") {
          return cell.value == null
              ? Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: SvgPicture.asset(IconAssets.delivery),
                )
              : Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: Image.network(cell.value),
                );
        }
        if (cell.columnName == "action") {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedSmallIconbtn(onTap: () {}, icon: Icons.edit, color: Colors.green),
              SizedBox(width: 10),
              RoundedSmallIconbtn(onTap: () {}, icon: Icons.delete, color: Colors.red),
              SizedBox(width: 5),
            ],
          );
        } else {
          return Center(
            child: Text(
              cell.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: onprimaryContainerColor),
            ),
          );
        }
      }).toList(),
    );
  }
}
