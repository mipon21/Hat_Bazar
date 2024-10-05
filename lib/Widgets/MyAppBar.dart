import 'package:flutter/material.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsivelayout.isDesktop(context);
    return Container(
      height: 70,
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (isDesktop)
            SizedBox(
              width: 10,
            ),
            if (!isDesktop)
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu)),
            if(isDesktop) Spacer(),      
            Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                  hintText: "Search here...",
                  fillColor: Theme.of(context).colorScheme.background,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary
                    )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  suffixIcon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Icon(Icons.search, color: Colors.white),
                  )),
            )),
            Container(
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text("M",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            )),
                  ),
                  if(isDesktop)
                  SizedBox(
                    width: 10,
                  ),
                  if(isDesktop)
                  Text("Mipon Rahman",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
