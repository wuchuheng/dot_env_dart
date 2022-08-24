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
      DotEnv(file: file);
      expect(DotEnv.get('FOO', ''), 'foo');
      expect(DotEnv.get('SIGN_QUOTATION', ''), 'SIGN_QUOTATION');
      expect(DotEnv.get('DOUBLE_QUOTE', ''), 'DOUBLE_QUOTE');
      expect(
        DotEnv.get('TRIM_SPACE_FROM_UNQUOTE', ''),
        'TRIM_SPACE_FROM_UNQUOTE',
      );
      expect(DotEnv.get('BOOL', false), true);
    });
  });
}
