import 'package:alf_lints/src/libraries/file_path/get_package_identifier.dart';
import 'package:test/test.dart';

void main() {
  group('getPackageIdentifier', () {
    test('should return `null` when full path is `null`', () {
      expect(getPackageIdentifier(null), isNull);
    });

    test('should return the package identifier', () {
      expect(
        getPackageIdentifier(
          '.../packages/libraries/example_lib/lib/features/example_feature.dart',
        ),
        equals('libraries/example_lib'),
      );
    });
  });
}
