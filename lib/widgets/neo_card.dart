import 'package:flutter/material.dart';

class NeoCard extends StatelessWidget {
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowOffset;
  final Widget child;
  final VoidCallback? onTap;

  const NeoCard({
    super.key,
    required this.child,
    this.backgroundColor = const Color(0xFFFFE156),
    this.shadowColor = Colors.black,
    this.shadowOffset = 2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 3, color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: Offset(shadowOffset, shadowOffset),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
