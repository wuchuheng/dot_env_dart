import 'dart:io';

import 'package:test/test.dart';
import 'package:wuchuheng_env/wuchuheng_env.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Env Test', () {
      final file = '${Directory.current.path}/test/.env';
      final env = Load(file: file).env;
      expect(env['FOO'], 'foo');
      expect(env['SIGN_QUOTATION'], 'SIGN_QUOTATION');
      expect(env['DOUBLE_QUOTE'], 'DOUBLE_QUOTE');
      expect(env['TRIM_SPACE_FROM_UNQUOTE'], 'TRIM_SPACE_FROM_UNQUOTE');
    });
  });
}
