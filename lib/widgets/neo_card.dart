import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeoCard extends StatefulWidget {
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowOffset;
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool holdToConfirm;
  final Duration holdDuration;
  final Color? holdProgressColor;

  const NeoCard({
    super.key,
    required this.child,
    this.backgroundColor = Colors.yellowAccent,
    this.shadowColor = Colors.black,
    this.shadowOffset = 2,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.holdToConfirm = false,
    this.holdDuration = const Duration(milliseconds: 1500),
    this.holdProgressColor,
  });

  @override
  State<NeoCard> createState() => _NeoCardState();
}

class _NeoCardState extends State<NeoCard> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  AnimationController? _holdController;

  @override
  void initState() {
    super.initState();
    if (widget.holdToConfirm) {
      _holdController = AnimationController(
        vsync: this,
        duration: widget.holdDuration,
      );
      _holdController!.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          HapticFeedback.heavyImpact();
          widget.onTap?.call();
          _holdController!.reset();
          setState(() => _isPressed = false);
        }
      });
    }
  }

  @override
  void dispose() {
    _holdController?.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    if (widget.holdToConfirm) {
      HapticFeedback.selectionClick();
      _holdController!.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.holdToConfirm) {
      _holdController!.reset();
    } else {
      HapticFeedback.selectionClick();
      widget.onTap?.call();
    }
    setState(() => _isPressed = false);
  }

  void _onTapCancel() {
    if (widget.holdToConfirm) {
      _holdController!.reset();
    }
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null ? _onTapDown : null,
      onTapUp: widget.onTap != null ? _onTapUp : null,
      onTapCancel: widget.onTap != null ? _onTapCancel : null,
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              if (widget.holdToConfirm && _holdController != null)
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _holdController!,
                    builder: (context, child) {
                      return FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _holdController!.value,
                        child: Container(
                          color: widget.holdProgressColor ??
                              Colors.white.withValues(alpha: 0.3),
                        ),
                      );
                    },
                  ),
                ),
              Padding(
                padding: widget.padding,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
