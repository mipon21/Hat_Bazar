import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hat_bazar/Models/SubCategory.dart';
import 'package:hat_bazar/Widgets/HoverEffect.dart';

class SubCategorySearchDropdownMenu extends StatefulWidget {
  final List<SubCategory> items;
  final String hintText;
  final ValueChanged<SubCategory> valueChanged;

  const SubCategorySearchDropdownMenu({
    super.key,
    required this.items,
    required this.hintText,
    required this.valueChanged, required String selectedValue,
  });

  @override
  State<SubCategorySearchDropdownMenu> createState() =>
      _SubCategorySearchDropdownMenuState();
}

class _SubCategorySearchDropdownMenuState
    extends State<SubCategorySearchDropdownMenu> {
  SubCategory? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SubCategorySearchDropdownMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Reset selected subcategory if the subcategory list changes
    if (oldWidget.items != widget.items) {
      setState(() {
        selectedValue = null; // Reset selected subcategory
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return HoverEffect(builder: (isHover) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isHover
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<SubCategory>(
            isExpanded: true,
            hint: Text(
              widget.hintText,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: widget.items
                .map((subcategory) => DropdownMenuItem<SubCategory>(
                      value: subcategory,
                      child: Text(
                        subcategory.title!,
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
              widget.valueChanged(value!); // Trigger callback with new value
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
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
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
    });
  }
}
