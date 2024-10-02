import 'package:flutter/material.dart';

class HoverEffect extends StatefulWidget {
  final Widget Function(bool isHover) builder;
  const HoverEffect({super.key, required this.builder});

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        print("Mouse Entered");
        isHover = true;
        setState(() {});
      },
      onExit: (value) {
        print("Mouse Exited");
        isHover = false;
        setState(() {});
      },
      child: widget.builder(isHover),
    );
  }
}
