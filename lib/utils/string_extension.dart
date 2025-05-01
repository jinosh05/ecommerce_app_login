extension StringExtension on String {
  String toTitleCase() {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
