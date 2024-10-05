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
    required this.title, 
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile( 
        onTap: onPressed,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected 
                  ? Colors.white
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        shape: RoundedRectangleBorder( // Correct property for rounding
          borderRadius: BorderRadius.circular(10),
        ),
        leading: SvgPicture.asset(
          icon,
          color: isSelected 
              ? Colors.white
              : Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        selected: isSelected,
        selectedColor: Colors.white,
        selectedTileColor: primaryColor,
      ),
    );
  }
}
