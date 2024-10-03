import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropdownMenu extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final ValueChanged<String> valueChanged;

  const MyDropdownMenu({
    super.key,
    required this.items,
    required this.hintText,
    required this.valueChanged,
  });

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: widget.items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.valueChanged(value!); // Corrected callback name
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 200,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for an item...',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
