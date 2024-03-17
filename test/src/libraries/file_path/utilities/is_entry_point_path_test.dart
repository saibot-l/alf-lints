import 'package:alf_lints/src/libraries/file_path/utilities/is_entry_point_path.dart';
import 'package:test/test.dart';

void main() {
  group('isEntryPointPath', () {
    const packageName = 'some_package_name';

    test('should return `false` when the absolute path is `null`', () {
      expect(
        isEntryPointPath(null, packageName: packageName),
        isFalse,
      );
    });

    test(
        'should return `false` when the absolute path does not point to a valid entry point',
        () {
      expect(
        isEntryPointPath('lib/invalid_filename.dart', packageName: packageName),
        isFalse,
      );
      expect(
        isEntryPointPath('lib/src/main.dart', packageName: packageName),
        isFalse,
      );
    });

    test(
        'should return `true` when the absolute path points to a valid entry point in `bin`',
        () {
      expect(
        isEntryPointPath('bin/main.dart', packageName: packageName),
        isTrue,
      );
      expect(
        isEntryPointPath('bin/main_dev.dart', packageName: packageName),
        isTrue,
      );
      expect(
        isEntryPointPath('bin/$packageName.dart', packageName: packageName),
        isTrue,
      );
    });

    test(
        'should return `true` when the absolute path points to a valid entry point in `lib`',
        () {
      expect(
        isEntryPointPath('lib/main.dart', packageName: packageName),
        isTrue,
      );
      expect(
        isEntryPointPath('lib/main_dev.dart', packageName: packageName),
        isTrue,
      );
      expect(
        isEntryPointPath('lib/$packageName.dart', packageName: packageName),
        isTrue,
      );
    });
  });
}
