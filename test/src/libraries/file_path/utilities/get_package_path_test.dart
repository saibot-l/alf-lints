import 'package:alf_lints/src/libraries/file_path/utilities/get_package_path.dart';
import 'package:test/test.dart';

void main() {
  group('getPackagePath', () {
    test('should return `null` when absolute path is `null`', () {
      expect(getPackagePath(null), isNull);
    });

    test('should return path to package including package name', () {
      expect(
        getPackagePath(
          '.../packages/libraries/example_lib/lib/features/example_feature.dart',
        ),
        equals('.../packages/libraries/example_lib'),
      );
    });
  });
}
