// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Config/Colors.dart';
import 'package:hat_bazar/Const/ProductData.dart';
import 'package:hat_bazar/Models/Product.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final productDataSource = ProductDataSource(products);
    return Container(
      height: 600,
      width: 1200,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 10,),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: SfDataGrid(
          source: productDataSource,
          allowFiltering: true,
          allowSorting: true,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.none,
          columns: [
            GridColumn(
                allowFiltering: false,
                width: 100,
                columnName: "id",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("ID")))),
            GridColumn(
                allowFiltering: false,
                width: 120,
                columnName: "name",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("NAME")))),
            GridColumn(
                allowFiltering: false,
                width: 120,
                columnName: "purchasePrice",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("B PRICE")))),
            GridColumn(
                allowFiltering: false,
                width: 120,
                columnName: "sellPrice",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("S PRICE")))),
            GridColumn(
                allowSorting: false,
                width: 100,
                columnName: "isActive",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("ACTIVE")))),
            GridColumn(
                allowFiltering: false,
                width: 90,
                columnName: "stock",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("STOCK")))),
            GridColumn(
                allowSorting: false,
                width: 150,
                columnName: "supplier",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("SELLER")))),
            GridColumn(
              allowSorting: false,
                width: 80,
                columnName: "unit",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("UNIT")))),
            GridColumn(
                allowSorting: false,
                allowFiltering: false,
                width: 150,
                columnName: "tags",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("TAGS")))),
            GridColumn(
                allowSorting: false,
                allowFiltering: false,
                width: 100,
                columnName: "action",
                label: Container(
                    decoration: BoxDecoration(),
                    child: Center(child: Text("ACTION")))),
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
              DataGridCell(columnName: "name", value: product.name),
              DataGridCell(
                  columnName: "purchasePrice", value: product.purchasePrice),
              DataGridCell(columnName: "sellPrice", value: product.sellPrice),
              DataGridCell(columnName: "isActive", value: product.isActive),
              DataGridCell(columnName: "stock", value: product.stock),
              DataGridCell(columnName: "supplier", value: product.supplier),
              DataGridCell(columnName: "unit", value: product.unit),
              DataGridCell(columnName: "tags", value: product.tags),
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
      if (cell.columnName == "action") {
        return Row(
          children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.print)),
              SizedBox(width: 10,),
              IconButton(onPressed: (){}, icon: Icon(Icons.zoom_out_map_rounded)),
            ],
        );
      } else {
        return Center(
          child: Text(
            cell.value.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: onprimaryContainerColor
            ),
          ),
        );
      }
    }).toList());
  }
}
