import 'dart:math';

import 'package:grocery/data/emoji_mappings.dart';

class EmojiSuggestionService {
  static final EmojiSuggestionService instance = EmojiSuggestionService._();

  EmojiSuggestionService._();

  String suggestEmoji(String itemName, {String languageCode = 'en'}) {
    if (itemName.isEmpty) return EmojiMappings.defaultEmoji;

    final normalized = _normalizeText(itemName);
    final keywordMap = EmojiMappings.getKeywordMap(languageCode);

    final exactMatch = keywordMap[normalized];
    if (exactMatch != null) return exactMatch;

    final containsMatch = _searchByContains(normalized, keywordMap);
    if (containsMatch != null) return containsMatch;

    final fuzzyMatch = _searchByFuzzyMatch(normalized, keywordMap);
    if (fuzzyMatch != null) return fuzzyMatch;

    return EmojiMappings.defaultEmoji;
  }

  String _normalizeText(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[áàãâä]'), 'a')
        .replaceAll(RegExp(r'[éèêë]'), 'e')
        .replaceAll(RegExp(r'[íìîï]'), 'i')
        .replaceAll(RegExp(r'[óòõôö]'), 'o')
        .replaceAll(RegExp(r'[úùûü]'), 'u')
        .replaceAll('ç', 'c')
        .trim();
  }

  String? _searchByContains(String normalized, Map<String, String> keywordMap) {
    for (final entry in keywordMap.entries) {
      if (normalized.contains(entry.key) || entry.key.contains(normalized)) {
        return entry.value;
      }
    }
    return null;
  }

  String? _searchByFuzzyMatch(String normalized, Map<String, String> keywordMap) {
    const int threshold = 2;
    String? bestMatch;
    int bestDistance = threshold + 1;

    for (final entry in keywordMap.entries) {
      final distance = _levenshteinDistance(normalized, entry.key);
      if (distance < bestDistance) {
        bestDistance = distance;
        bestMatch = entry.value;
      }
    }

    return bestDistance <= threshold ? bestMatch : null;
  }

  int _levenshteinDistance(String s1, String s2) {
    if (s1.isEmpty) return s2.length;
    if (s2.isEmpty) return s1.length;

    List<List<int>> matrix = List.generate(
      s1.length + 1,
      (i) => List.generate(s2.length + 1, (j) => 0),
    );

    for (int i = 0; i <= s1.length; i++) {
      matrix[i][0] = i;
    }
    for (int j = 0; j <= s2.length; j++) {
      matrix[0][j] = j;
    }

    for (int i = 1; i <= s1.length; i++) {
      for (int j = 1; j <= s2.length; j++) {
        int cost = s1[i - 1] == s2[j - 1] ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j - 1] + cost,
        ].reduce(min);
      }
    }

    return matrix[s1.length][s2.length];
  }
}
