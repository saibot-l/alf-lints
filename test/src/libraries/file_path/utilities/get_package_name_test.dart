import 'package:alf_lints/src/libraries/file_path/utilities/get_package_name.dart';
import 'package:test/test.dart';

void main() {
  group('getPackageName', () {
    test('should return `null` when uri is `null`', () {
      expect(getPackageName(null), isNull);
    });

    test('should return `null` when uri does not start with `package:`', () {
      expect(getPackageName('no-package'), isNull);
    });

    test('should return package name', () {
      expect(
        getPackageName('package:some-package/some/nested/import.dart'),
        equals('some-package'),
      );
    });
  });
}
