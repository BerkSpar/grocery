import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeoCard extends StatefulWidget {
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowOffset;
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  const NeoCard({
    super.key,
    required this.child,
    this.backgroundColor = Colors.yellowAccent,
    this.shadowColor = Colors.black,
    this.shadowOffset = 2,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  State<NeoCard> createState() => _NeoCardState();
}

class _NeoCardState extends State<NeoCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null
          ? (_) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.onTap != null
          ? (_) {
              setState(() => _isPressed = false);
              HapticFeedback.selectionClick();
              widget.onTap?.call();
            }
          : null,
      onTapCancel: widget.onTap != null
          ? () => setState(() => _isPressed = false)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        transform: Matrix4.translationValues(
          _isPressed ? widget.shadowOffset : 0,
          _isPressed ? widget.shadowOffset : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 3, color: Colors.black),
          boxShadow: _isPressed || widget.onTap == null
              ? []
              : [
                  BoxShadow(
                    color: widget.shadowColor,
                    offset: Offset(widget.shadowOffset, widget.shadowOffset),
                  ),
                ],
        ),
        padding: widget.padding,
        child: widget.child,
      ),
    );
  }
}
