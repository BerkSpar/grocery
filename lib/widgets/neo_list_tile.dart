import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NeoListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool checked;
  final String emoji;
  final VoidCallback onTap;

  const NeoListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.checked,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 3, color: Colors.black),
        color: checked ? Colors.green.shade100 : Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 3, color: Colors.black),
                color: checked ? Colors.green.shade800 : null,
              ),
              height: 24,
              width: 24,
              child: checked
                  ? PhosphorIcon(
                      PhosphorIconsBold.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Text(emoji, style: TextStyle(fontSize: 24)),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  decoration: checked ? TextDecoration.lineThrough : null,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  decoration: checked ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
          Spacer(),
          PhosphorIcon(PhosphorIcons.dotsThreeOutlineVertical()),
        ],
      ),
    );
  }
}
