// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/Colors.dart';
import 'package:hat_bazar/Const/ProductData.dart';
import 'package:hat_bazar/Models/Product.dart';
import 'package:hat_bazar/Widgets/Rounded_Small_IconBtn.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart'; // Import your ResponsiveLayout

class ProductsTableData extends StatelessWidget {
  const ProductsTableData({super.key});

  @override
  Widget build(BuildContext context) {
    final productDataSource = ProductDataSource(products);
    
    double containerWidth;
    List<double> columnWidths;
    double containerHeight;

    // Responsive settings
    if (Responsivelayout.isMobile(context)) {
      containerWidth = double.infinity; // Full width for mobile
      containerHeight = 400;
      columnWidths = [50, 80, 80, 80, 90, 80, 120, 75, 120, 120]; // Mobile widths
    } else if (Responsivelayout.isTablet(context)) {
      containerWidth = 600; // Fixed width for tablet
      containerHeight = 500;
      columnWidths = [100, 120, 120, 120, 100, 100, 150, 80, 150, 100]; // Tablet widths
    } else {
      containerWidth = 1200; // Fixed width for desktop
      containerHeight = 600;
      columnWidths = [100, 120, 120, 120, 100, 90, 150, 80, 150, 100]; // Desktop widths
    }

    return Container(
      height: containerHeight,
      width: containerWidth, // Responsive width
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: SfDataGrid(
          rowHeight: 150,
          source: productDataSource,
          allowFiltering: true,
          allowSorting: true,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.none,
          columns: [
            GridColumn(
                allowFiltering: false,
                width: columnWidths[0],
                columnName: "id",
                label: Center(child: Text("ID", maxLines: 1,overflow: TextOverflow.ellipsis,))),
            GridColumn(
                allowFiltering: false,
                width: columnWidths[1],
                columnName: "images",
                label: Center(child: Text("IMAGE"))),
            GridColumn(
                allowFiltering: false,
                width: columnWidths[2],
                columnName: "name",
                label: Center(child: Text("NAME"))),
            GridColumn(
                allowFiltering: false,
                width: columnWidths[3],
                columnName: "purchasePrice",
                label: Center(child: Text("B PRICE"))),
            GridColumn(
                allowFiltering: false,
                width: columnWidths[4],
                columnName: "sellPrice",
                label: Center(child: Text("S PRICE"))),
            GridColumn(
                allowFiltering: false,
                width: columnWidths[5],
                columnName: "stock",
                label: Center(child: Text("STOCK"))),
            GridColumn(
                allowSorting: false,
                width: columnWidths[6],
                columnName: "supplier",
                label: Center(child: Text("SELLER"))),
            GridColumn(
                allowSorting: false,
                width: columnWidths[7],
                columnName: "unit",
                label: Center(child: Text("UNIT"))),
            GridColumn(
                allowSorting: false,
                width: columnWidths[8],
                columnName: "isActive",
                label: Center(child: Text("ACTIVE"))),
            GridColumn(
                allowSorting: false,
                allowFiltering: false,
                width: columnWidths[9],
                columnName: "action",
                label: Center(child: Text("ACTION"))),
          ]),
    );
  }
}

class ProductDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;
  
  ProductDataSource(List<Product> products) {
    dataGridRows = products
        .map<DataGridRow>((product) => DataGridRow(cells: [
              DataGridCell(columnName: "id", value: product.id),
              DataGridCell(columnName: "images", value: product.images),
              DataGridCell(columnName: "name", value: product.name),
              DataGridCell(columnName: "purchasePrice", value: product.purchasePrice),
              DataGridCell(columnName: "sellPrice", value: product.sellPrice),
              DataGridCell(columnName: "stock", value: product.stock),
              DataGridCell(columnName: "supplier", value: product.supplier),
              DataGridCell(columnName: "unit", value: product.unit),
              DataGridCell(columnName: "isActive", value: product.isActive),
              DataGridCell(columnName: "action", value: product.tags),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((cell) {
      if (cell.columnName == "images") {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.withOpacity(0.2)),
        );
      }
      if (cell.columnName == "isActive") {
        return Center(
          child: Icon(
            cell.value == true ? Icons.done : Icons.cancel,
            color: cell.value == true ? Colors.green : Colors.red,
          ),
        );
      }
      if (cell.columnName == "action") {
        return Row(
          children: [
            RoundedSmallIconbtn(
                onTap: () {}, icon: Icons.edit, color: Colors.green),
            SizedBox(width: 5),
            RoundedSmallIconbtn(
                onTap: () {}, icon: Icons.delete, color: Colors.red),
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
    }).toList());
  }
}
