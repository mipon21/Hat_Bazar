import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Const/Value.dart';
import 'package:hat_bazar/Widgets/HoverEffect.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';

class HomeStatics extends StatelessWidget {
  final String lable;
  final String value;
  final String icon;
  const HomeStatics({
    super.key,
    required this.lable,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double textSize;
    double containerWidth;
    double containerHeight;

    // Responsive settings
    if (Responsivelayout.isMobile(context)) {
      textSize = 20; // Full width for mobile
      containerWidth = 50;
      containerHeight = 50;
    } else if (Responsivelayout.isTablet(context)) {
      textSize = 16; 
      containerWidth = 50;
      containerHeight = 50;
    } else {
      textSize = 25;
      containerWidth = 50;
      containerHeight = 50; // Desktop widths
    }

    return HoverEffect(
      builder: (isHover) => AnimatedContainer(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isHover
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Theme.of(context).colorScheme.primaryContainer,
        ),
        duration: DefaultValue.animationDuration,
        child: Row(
          children: [
            Container(
              width: containerHeight,
              height: containerWidth,
              decoration: BoxDecoration(
                  color: icon == IconAssets.cart
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                      : icon == IconAssets.refresh
                          ? Color.fromARGB(255, 222, 12, 12).withOpacity(0.2)
                          : icon == IconAssets.delivery
                              ? Color(0xff1400FC).withOpacity(0.2)
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.all(15),
              child: SvgPicture.asset(
                icon,
                width: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lable,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: textSize
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
