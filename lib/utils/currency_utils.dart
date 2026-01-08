import 'package:cartly/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyUtils {
  /// Tries to parse a localized currency/number string into a [double],
  /// automatically handling different decimal and thousands separators.
  ///
  /// This method is locale-agnostic and supports common formats such as:
  ///
  /// - Brazilian / European format:
  ///   - `"2.222,22"` → `2222.22`
  ///   - `"1.234.567,89"` → `1234567.89`
  ///
  /// - US / International format:
  ///   - `"2,222.22"` → `2222.22`
  ///   - `"1,234,567.89"` → `1234567.89`
  ///
  /// Any non-numeric characters (except `.` and `,`) are ignored, making this
  /// function safe to use with formatted currency strings (e.g. `"R$ 2.222,22"`).
  ///
  /// The parsing strategy assumes that the **last occurrence of `.` or `,`**
  /// represents the decimal separator, while previous occurrences are treated
  /// as thousands separators.
  ///
  /// Returns `0.0` if the input is empty, invalid, or cannot be parsed.
  static double tryParseCurrencyStringToDouble(String value) {
    if (value.isEmpty) return 0.0;

    value = value.trim();

    value = value.replaceAll(RegExp(r'[^\d,\.]'), '');

    if (value.isEmpty) return 0.0;

    final hasComma = value.contains(',');
    final hasDot = value.contains('.');

    if (hasComma && hasDot) {
      if (value.lastIndexOf(',') > value.lastIndexOf('.')) {
        // BR/EU
        value = value.replaceAll('.', '');
        value = value.replaceAll(',', '.');
      } else {
        // US/INTERNATIONAL
        value = value.replaceAll(',', '');
      }
    } else if (hasComma) {
      value = value.replaceAll(',', '.');
    }

    return double.tryParse(value) ?? 0.0;
  }

  /// Formats a monetary value into a localized currency string based on the
  /// current application locale.
  ///
  /// This method uses the active [BuildContext] to determine the user's locale.
  ///
  /// The currency symbol is retrieved from the application's localization
  /// resources ([context.l10n.prefixMoneySymbol]), allowing control over translation.
  ///
  /// Examples:
  /// - Locale `pt_BR`:
  ///   - `1234.5` → `R$ 1.234,50`
  ///
  /// - Locale `en_US`:
  ///   - `1234.5` → `$1,234.50`
  ///
  /// The value is always formatted with exactly two decimal digits.
  ///
  /// Returns a localized currency string representing the given value.
  static String getFormattedLocalizedPrice(
    BuildContext context,
    double currency,
  ) {
    return NumberFormat.currency(
      locale: Localizations.localeOf(context).languageCode,
      symbol: context.l10n.prefixMoneySymbol,
      decimalDigits: 2,
    ).format(currency);
  }
}
