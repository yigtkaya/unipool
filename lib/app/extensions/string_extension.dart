/// String extension to capitalize the first letter of the string.
extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

extension IntExtension on int {
  String twoDigits() {
    return this >= 10 ? '$this' : '0$this';
  }
}
