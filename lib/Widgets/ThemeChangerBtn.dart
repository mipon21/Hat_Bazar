import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Config/Theme.dart';
import 'package:hat_bazar/Providers/ThemeProvider.dart';
import 'package:provider/provider.dart';

class ThemeChangeBtn extends StatelessWidget {
  const ThemeChangeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeData == darkTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5), // Reduced padding
              height: 60, // Reduced height
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Light Mode Button
                  InkWell(
                    onTap: () {
                      if (isDarkMode) themeProvider.toggleTheme();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Reduced padding
                      decoration: BoxDecoration(
                        color: !isDarkMode
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconAssets.light,
                            color: !isDarkMode
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          SizedBox(width: 3), // Reduced space between icon and text
                          Text(
                            'LIGHT',
                            style: TextStyle(
                              fontWeight: !isDarkMode ? FontWeight.bold : FontWeight.normal,
                              fontSize: 12, // Reduced font size
                              color: !isDarkMode
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  // Dark Mode Button
                  InkWell(
                    onTap: () {
                      if (!isDarkMode) themeProvider.toggleTheme();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Reduced padding
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconAssets.dark,
                            color: isDarkMode
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          SizedBox(width: 3), // Reduced space between icon and text
                          Text(
                            'DARK',
                            style: TextStyle(
                              fontWeight: isDarkMode ? FontWeight.bold : FontWeight.normal,
                              fontSize: 12, // Reduced font size
                              color: isDarkMode
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
