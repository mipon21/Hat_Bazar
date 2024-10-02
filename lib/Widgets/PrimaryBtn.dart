import 'package:flutter/material.dart';
import 'package:hat_bazar/Widgets/HoverEffect.dart';

class PrimarBbtn extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;
  final Color color;
  const PrimarBbtn(
      {super.key, required this.onTap, required this.name, 
      required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: HoverEffect(
        builder: (isHover) => AnimatedContainer(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
              color: isHover
                  ? color
                  : color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(
                icon,
                color: isHover
                    ? Colors.white
                    : color,
              ),
              Text(
                name,
                style: TextStyle(
                  color: isHover
                      ? Colors.white
                      : color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
