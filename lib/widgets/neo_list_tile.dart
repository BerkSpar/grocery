import 'package:flutter/material.dart';
import 'package:grocery/helpers/haptic_helper.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NeoListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool checked;
  final String emoji;
  final VoidCallback onTap;
  final VoidCallback onTapOption;

  const NeoListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.checked,
    required this.emoji,
    required this.onTap,
    required this.onTapOption,
  });

  @override
  State<NeoListTile> createState() => _NeoListTileState();
}

class _NeoListTileState extends State<NeoListTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.15), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 0.15, end: -0.15), weight: 50),
      TweenSequenceItem(tween: Tween(begin: -0.15, end: 0.0), weight: 25),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.checked) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(NeoListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.checked != oldWidget.checked) {
      if (widget.checked) {
        HapticHelper.medium();
        _controller.forward(from: 0.0);
      } else {
        HapticHelper.light();
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 3, color: Colors.black),
        color: widget.checked ? Colors.green.shade100 : Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 3, color: Colors.black),
                      color: widget.checked ? Colors.green.shade800 : null,
                    ),
                    height: 24,
                    width: 24,
                    child: Center(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: widget.checked ? 1.0 : 0.0,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 200),
                          scale: widget.checked ? 1.0 : 0.0,
                          child: PhosphorIcon(
                            PhosphorIconsBold.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Text(widget.emoji, style: TextStyle(fontSize: 24)),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  decoration: widget.checked
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  decoration: widget.checked
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: widget.onTapOption,
            child: SizedBox(
              height: 40,
              width: 40,
              child: PhosphorIcon(PhosphorIcons.dotsThreeOutlineVertical()),
            ),
          ),
        ],
      ),
    );
  }
}
