import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TimerHeader extends StatefulWidget {
  final DateTime startedAt;
  final VoidCallback? onClose;

  const TimerHeader({super.key, required this.startedAt, this.onClose});

  @override
  State<TimerHeader> createState() => _TimerHeaderState();
}

class _TimerHeaderState extends State<TimerHeader> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateElapsed();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateElapsed(),
    );
  }

  void _updateElapsed() {
    setState(() {
      _elapsed = DateTime.now().difference(widget.startedAt);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NeoCard(
            onTap: () {
              widget.onClose?.call();
              Navigator.of(context).pop();
            },
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(8),
            child: PhosphorIcon(PhosphorIconsBold.arrowLeft, size: 24),
          ),
          NeoCard(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  _formatDuration(_elapsed),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                PhosphorIcon(PhosphorIcons.clock(), size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
