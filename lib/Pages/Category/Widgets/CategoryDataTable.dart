// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Config/Colors.dart';
import 'package:hat_bazar/Const/ProductData.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';
import 'package:hat_bazar/models/Category.dart';
import 'package:hat_bazar/Providers/CategoryProvider.dart';
import 'package:hat_bazar/Widgets/Rounded_Small_IconBtn.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CategoryTableData extends StatelessWidget {
  const CategoryTableData({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categoryDataSource = CategoryDataSource(categoryProvider.categories);

    // Responsive Variables
    double containerWidth;
    List<double> columnWidths;
    double containerHeight; // Define container height variable
    double rowHeight; // Define row height variable

    if (Responsivelayout.isMobile(context)) {
      containerWidth = double.infinity; // Full width for mobile
      containerHeight = 400; // Adjusted height for mobile
      rowHeight = 80; // Adjusted row height for mobile
      columnWidths = [50, 80, 150, 120, 120]; // Mobile widths
    } else if (Responsivelayout.isTablet(context)) {
      containerWidth = 600; // Fixed width for tablet
      containerHeight = 500; // Adjusted height for tablet
      rowHeight = 100; // Adjusted row height for tablet
      columnWidths = [100, 120, 200, 200, 120]; // Tablet widths
    } else {
      containerWidth = 1200; // Fixed width for desktop
      containerHeight = 600; // Adjusted height for desktop
      rowHeight = 150; // Adjusted row height for desktop
      columnWidths = [100, 120, 250, 500, 150]; // Desktop widths
    }

    return Container(
      height: containerHeight, // Set responsive container height
      width: containerWidth,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SfDataGrid(
        rowHeight: rowHeight, // Set responsive row height
        source: categoryDataSource,
        allowFiltering: true,
        allowSorting: true,
        headerGridLinesVisibility: GridLinesVisibility.none,
        gridLinesVisibility: GridLinesVisibility.none,
        columns: [
          GridColumn(
            allowFiltering: false,
            width: columnWidths[0],
            columnName: "id",
            label: Center(
              child: Text(
                "ID",
              ),
            ),
          ),
          GridColumn(
            allowFiltering: false,
            width: columnWidths[1],
            columnName: "images",
            label: Center(
              child: Text(
                "IMAGE",
              ),
            ),
          ),
          GridColumn(
            allowFiltering: false,
            width: columnWidths[2],
            columnName: "title",
            label: Center(
              child: Text(
                "CATEGORY NAME",
              ),
            ),
          ),
          GridColumn(
            allowFiltering: false,
            width: columnWidths[3],
            columnName: "subCategories",
            label: Center(
              child: Text(
                "SUB-CATEGORY NAME",
              ),
            ),
          ),
          GridColumn(
            allowSorting: false,
            allowFiltering: false,
            width: columnWidths[4],
            columnName: "action",
            label: Center(
              child: Text(
                "ACTION",
              ),
            ),
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
                  child: SizedBox(
                    child: SvgPicture.asset(
                      IconAssets.delivery,
                      width: 20,
                    ),
                  ),
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
        if (cell.columnName == "id") {
          return Center(
            child: Text(
              cell.value.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: onprimaryContainerColor),
            ),
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
