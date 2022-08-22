import 'dart:io';

import 'package:wuchuheng_env/wuchuheng_env.dart';

void main() {
  final file = '${Directory.current.path}/test/.env';
  final env = Load(file: file).env;
  env['FOO'];
  env['SIGN_QUOTATION'];
  env['DOUBLE_QUOTE'];
  env['TRIM_SPACE_FROM_UNQUOTE'];
}
