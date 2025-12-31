//Database Helpers

import 'dart:async';

import 'package:grocery/database/database.dart';

/// Creates a stream that reacts to the currently open cart and switches
/// its inner subscription whenever the open cart changes.
///
/// This function listens to the open cart stream and:
/// - Cancels the previous inner stream when the cart changes
/// - Subscribes to a new stream built from the current cart id
/// - Emits values from the active inner stream
///
/// If there is no open cart, the stream emits the provided [noOpenCartValue]
/// instead of subscribing to an inner stream.
Stream<T> switchOnOpenCart<T>(
  Stream<CartData?> cartStream,
  Stream<T> Function(int cartId) builder, {
  required T noOpenCartValue,
}) {
  late StreamSubscription cartSub;
  StreamSubscription? dataSub;

  final controller = StreamController<T>();

  cartSub = cartStream.listen((cart) async {
    await dataSub?.cancel();
    dataSub = null;

    if (cart == null) {
      controller.add(noOpenCartValue);
      return;
    }

    dataSub = builder(cart.id).listen(controller.add);
  });

  controller.onCancel = () async {
    await cartSub.cancel();
    await dataSub?.cancel();
  };

  return controller.stream;
}

/// Creates a stream that reacts to the currently open cart and switches
/// its inner subscription whenever the open cart changes.
///
/// This function listens to the open cart stream and:
/// - Cancels the previous inner stream when the cart changes
/// - Subscribes to a new stream built from the current cart id
/// - Emits values from the active inner stream
///
/// If there is no open cart, the stream emits `null` and does not keep
/// any inner subscription active.
Stream<T?> switchOnOpenCartOrNull<T>(
  Stream<CartData?> cartStream,
  Stream<T> Function(int cartId) builder,
) {
  late StreamSubscription cartSub;
  StreamSubscription? dataSub;

  final controller = StreamController<T?>();

  cartSub = cartStream.listen((cart) async {
    await dataSub?.cancel();
    dataSub = null;

    if (cart == null) {
      controller.add(null);
      return;
    }

    dataSub = builder(cart.id).listen(controller.add);
  });

  controller.onCancel = () async {
    await cartSub.cancel();
    await dataSub?.cancel();
  };

  return controller.stream;
}
