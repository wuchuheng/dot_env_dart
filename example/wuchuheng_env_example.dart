import 'dart:io';

import 'package:wuchuheng_env/wuchuheng_env.dart';

void main() {
  final file = '${Directory.current.path}/test/.env';
  DotEnv(file: file);
  print(DotEnv.get('FOO', '')); // print FOO
  print(DotEnv.get('SIGN_QUOTATION', '')); // print SIGN_QUOTATION
  print(DotEnv.get('DOUBLE_QUOTE', '')); // print DOUBLE_QUOTE
  print(
    DotEnv.get('TRIM_SPACE_FROM_UNQUOTE', ''),
  ); // print TRIM_SPACE_FROM_UNQUOTE
  print(DotEnv.get('BOOL', false)); // print bool
}
