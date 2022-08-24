import 'dart:io';

class DotEnv {
  static Map<String, String> env = {};

  DotEnv({required String file}) {
    String content = File(file).readAsStringSync();
    content = content.replaceAll(RegExp(r'^#.*\n+', multiLine: true), '');
    content = content.replaceAll(RegExp(r'#.*(?=\n+)', multiLine: true), '');
    final matches =
        RegExp(r'(^\w[\w|\d]+\s{0,}=\s{0,}[^\n]+)\s{0,}\n{0,}', multiLine: true)
            .allMatches(content);
    for (final element in matches) {
      final listStr = element.group(1)!.split('=');
      String value = listStr.sublist(1).join('=').trim();
      // Remove" or ' for value
      final valueMatches = RegExp(r'''(['|"])([^\n]+)\1''').allMatches(value);
      if (valueMatches.isNotEmpty) {
        value = valueMatches.elementAt(0).group(2)!;
      }
      final key = listStr[0].trim();
      env[key] = value;
    }
  }
  static T get<T>(String key, T defaultValue) {
    if (env.containsKey(key)) {
      final String value = env[key]!;
      if (defaultValue is bool) {
        final result = value.toLowerCase() == 'true';
        return result as T;
      } else if (defaultValue is int) {
        return int.parse(value) as T;
      } else if (defaultValue is String) {
        return value as T;
      }
      throw Error();
    }
    return defaultValue;
  }
}
