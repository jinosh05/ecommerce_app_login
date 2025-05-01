// ignore_for_file: lines_longer_than_80_chars

/// Strict Pattern
/// Symbol ^ and $ in pattern is to make sure all the string value following the pattern
/// Regex will return false if any of the character not following the pattern, even if using hasMatch function
/// Example: Pattern : Email -> 'This is your email : test@gmail.com' will return `false`, but 'test@gmail.com' will return `true`
library;

class RegexPattern {
  RegexPattern._();

  /// Username regex
  /// Requires minimum 3 character
  /// Allowing "_" and "." in middle of name
  static String username = r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$';

  /// Email regex
  static String email = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';

  /// Phone Number regex
  static String phone = r'^[0-9-]+$';

  /// Currency regex
  static String currency =
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$';

  /// Numeric Only regex (No Whitespace & Symbols)
  static String numericOnly = r'^\d+$';

  /// Alphabet Only regex (No Whitespace & Symbols)
  static String alphabetOnly = r'^[a-zA-Z]+$';

  /// Alphabet & Numeric Only regex (No Whitespace & Symbols)
  static String alphaNumericOnly = r'^[a-zA-Z0-9]+$';

  /// Alphabet, Numeric, Symbol Only regex (No Whitespace & Symbols)
  static String alphaNumericSymbolOnly = r'^[a-zA-Z0-9!@#$%^&*()-_+=]+$';

  /// Password (Easy) Regex
  /// Allowing all character except 'whitespace'
  /// Minimum character: 8
  static String passwordEasy = r'^\S{8,}$';

  /// UPI ID (No whitespace)
  static String upiId = r'^[a-zA-Z0-9.-]{2,256}@[a-zA-Z][a-zA-Z]{2,64}$';

  static String url =
      r'^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\\+#]*$';
}

class RegVal {
  RegVal._();

  /// Returns whether the pattern has a match in the string [str].
  static bool hasMatch(final String? str, final String pattern) =>
      str == null || RegExp(pattern).hasMatch(str);
}
