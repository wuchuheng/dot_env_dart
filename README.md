This is a dot env loading library

## Features


## Getting started

Depend on it
Run this command:

With Dart:

``` bash 
$ dart pub add wuchuheng_env
```
This will add a line like this to your package's `pubspec.yaml` (and run an implicit dart pub get):
``` yaml 
dependencies:
wuchuheng_env: ^1.0.2
```

Alternatively, your editor might support dart pub get. Check the docs for your editor to learn more.

Import it
Now in your Dart code, you can use:

``` dart 
import 'package:wuchuheng_env/wuchuheng_env.dart';
```

## Usage

to `/example` folder. 

```dart
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
```

## Additional information

contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
