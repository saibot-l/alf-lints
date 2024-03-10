import 'package:alf_lints/src/libraries/file_path/get_relative_package_path.dart';
import 'package:test/test.dart';

void main() {
  group('getRelativePackagePath', () {
    test('should return `null` when the package path is not supported',
        () async {
      expect(
        getRelativePackagePath(
          '.../invalid/features/example_feature.dart',
        ),
        equals(null),
      );
    });

    test('should return the relative package path when placed under `lib/`',
        () async {
      expect(
        getRelativePackagePath(
          '.../lib/features/example_feature.dart',
        ),
        equals('features/example_feature.dart'),
      );
    });

    test('should return the relative package path when placed under `src/lib/`',
        () async {
      expect(
        getRelativePackagePath(
          '.../lib/src/features/example_feature.dart',
        ),
        equals('features/example_feature.dart'),
      );
    });

    test(
        'should return the relative package path when package is inside another domain folder on package level`',
        () async {
      expect(
        getRelativePackagePath(
          'packages/libraries/example_lib/lib/src/features/example_feature.dart',
        ),
        equals('features/example_feature.dart'),
      );
    });
  });
}
