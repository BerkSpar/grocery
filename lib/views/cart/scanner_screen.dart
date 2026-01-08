import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cartly/extensions/context_extensions.dart';
import 'package:cartly/services/barcode_service.dart';
import 'package:cartly/widgets/neo_card.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scanController;
  late final Animation<double> _scanAnimation;
  bool canHandleBarcode = true;

  String? loadingText;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _scanAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadingText ??= context.l10n.placeBarcode;
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  void _handleBarcode(BarcodeCapture barcodes) async {
    if (!canHandleBarcode) return;
    canHandleBarcode = false;

    HapticFeedback.vibrate();

    setState(() {
      loadingText = context.l10n.analyzingProduct;
    });

    final barcode = barcodes.barcodes.firstOrNull;

    final [product, _] = await Future.wait([
      getProduct(barcode?.rawValue ?? ''),
      Future.delayed(Duration(seconds: 1)),
    ]);

    Navigator.of(context).pop(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MobileScanner(
            onDetect: _handleBarcode,
            controller: MobileScannerController(
              formats: [
                BarcodeFormat.ean13,
                BarcodeFormat.ean8,
                BarcodeFormat.upcA,
                BarcodeFormat.upcE,
              ],
            ),
          ),
          CustomPaint(size: Size.infinite, painter: _ScannerOverlayPainter()),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 160,
                  margin: EdgeInsets.symmetric(horizontal: 48),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                  child: AnimatedBuilder(
                    animation: _scanAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: _ScanBeamPainter(_scanAnimation.value),
                        size: Size.infinite,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text(loadingText!, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            left: 24,
            top: 24,
            child: SafeArea(
              child: NeoCard(
                onTap: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(8),
                child: PhosphorIcon(PhosphorIconsBold.arrowLeft, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withValues(alpha: 0.5);

    const holeHeight = 160.0;
    const horizontalMargin = 48.0;
    const borderRadius = 8.0;
    const textHeight = 16.0;
    const spacingHeight = 8.0;
    const totalColumnHeight = holeHeight + spacingHeight + textHeight;

    final holeWidth = size.width - (horizontalMargin * 2);
    final holeLeft = horizontalMargin;
    final holeTop = (size.height - totalColumnHeight) / 2;

    final fullRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final holeRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(holeLeft, holeTop, holeWidth, holeHeight),
      Radius.circular(borderRadius),
    );

    final path = Path()
      ..addRect(fullRect)
      ..addRRect(holeRect);
    path.fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScanBeamPainter extends CustomPainter {
  final double progress;

  _ScanBeamPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    const padding = 12.0;
    const beamHeight = 6.0;
    const borderWidth = 2.0;
    const shadowOffset = 3.0;
    const handleSize = 12.0;

    final y = padding + (size.height - padding * 2 - beamHeight) * progress;
    final beamRect = Rect.fromLTWH(
      padding,
      y,
      size.width - padding * 2,
      beamHeight,
    );

    final shadowPaint = Paint()..color = Colors.black;
    canvas.drawRect(
      beamRect.shift(Offset(shadowOffset, shadowOffset)),
      shadowPaint,
    );

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final fillPaint = Paint()..color = Colors.red;
    canvas.drawRect(beamRect, fillPaint);
    canvas.drawRect(beamRect, borderPaint);

    final leftHandle = Rect.fromCenter(
      center: Offset(padding, y + beamHeight / 2),
      width: handleSize,
      height: handleSize,
    );
    canvas.drawRect(
      leftHandle.shift(Offset(shadowOffset, shadowOffset)),
      shadowPaint,
    );
    canvas.drawRect(leftHandle, fillPaint);
    canvas.drawRect(leftHandle, borderPaint);

    final rightHandle = Rect.fromCenter(
      center: Offset(size.width - padding, y + beamHeight / 2),
      width: handleSize,
      height: handleSize,
    );
    canvas.drawRect(
      rightHandle.shift(Offset(shadowOffset, shadowOffset)),
      shadowPaint,
    );
    canvas.drawRect(rightHandle, fillPaint);
    canvas.drawRect(rightHandle, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _ScanBeamPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
