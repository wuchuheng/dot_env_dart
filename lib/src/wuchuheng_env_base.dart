import 'dart:io';

class Load {
  final Map<String, String> env = {};

  Load({required String file}) {
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
}
