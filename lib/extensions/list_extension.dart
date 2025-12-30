import 'dart:math';

extension ListExtension<T> on List<T> {
  T random() => this[Random().nextInt(length)];
}
