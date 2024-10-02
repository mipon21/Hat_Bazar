import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Widgets/HoverEffect.dart';

class RoundedSmallIconbtn extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  const RoundedSmallIconbtn({super.key, 
  required this.onTap, 
  required this.icon, required this.color,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: HoverEffect(
        builder: (isHover) => AnimatedContainer(
          duration: Duration(milliseconds: 400),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isHover
                  ? color
                  : color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            color: Colors.white,
          )),
        )
    );
  }
}
