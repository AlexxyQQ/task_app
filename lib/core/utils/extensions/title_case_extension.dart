extension TitleCaseExtension on String? {
  String toTitleCase({
    String nullValue = '',
  }) {
    if (this == null || this!.isEmpty) {
      return nullValue;
    }

    String trimmed = this!.trim();
    if (trimmed.isEmpty) {
      return nullValue;
    }

    return '${trimmed[0].toUpperCase()}${trimmed.substring(1).toLowerCase()}';
  }
}
