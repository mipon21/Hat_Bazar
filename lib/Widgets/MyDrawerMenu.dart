import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Config/Colors.dart';

class MyDrawerMenu extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String title;
  final bool isSelected;

  const MyDrawerMenu({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title, this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title, 
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: isSelected 
        ? Theme.of(context).colorScheme.onBackground
        : Theme.of(context).colorScheme.onPrimaryContainer,
      ),),
      leading: SvgPicture.asset(
        icon,
        color: isSelected 
        ? Theme.of(context).colorScheme.onBackground
        : Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      selected: isSelected,
      selectedColor: Colors.white,
      selectedTileColor: primaryColor,
    );
  }
}