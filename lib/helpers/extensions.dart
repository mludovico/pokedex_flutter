extension intExtension on int {
  String getFormattedField() {
    return this.toString().padLeft(2, '0');
  }
}

extension StringExtension on String {
  String capitalize() {
    try {
      final words = this.split(' ');
      final capitalizedWords = words.map((word) {
        final first = word[0].toUpperCase();
        return '$first${word.substring(1)}';
      }).toList();
      return capitalizedWords.join(' ');
    } on Exception {
      return this;
    }
  }
}
