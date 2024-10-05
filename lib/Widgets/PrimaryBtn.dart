import 'package:flutter/material.dart';
import 'package:hat_bazar/Widgets/HoverEffect.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart'; // Import your ResponsiveLayout

class PrimaryBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;
  final Color color; // Add a parameter for the tooltip message

  const PrimaryBtn({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Determine padding and font size based on device type
    double horizontalPadding;
    double verticalPadding;
    double fontSize;

    if (Responsivelayout.isMobile(context)) {
      horizontalPadding = 10; // Less padding for mobile
      verticalPadding = 8;
      fontSize = 14; // Smaller font size for mobile
    } else if (Responsivelayout.isTablet(context)) {
      horizontalPadding = 15; // Medium padding for tablet
      verticalPadding = 10;
      fontSize = 16; // Medium font size for tablet
    } else {
      horizontalPadding = 20; // More padding for desktop
      verticalPadding = 12;
      fontSize = 16; // Larger font size for desktop
    }

    return InkWell(
      onTap: onTap,
      child: HoverEffect(
        builder: (isHover) => AnimatedContainer(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: isHover ? color : color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isHover ? Colors.white : color,
                size: fontSize, // Adjust the icon size if needed
              ),
              SizedBox(width: 8), // Add some space between icon and text
              Text(
                name,
                style: TextStyle(
                  color: isHover ? Colors.white : color,
                  fontSize: fontSize, // Set the font size based on the device type
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
