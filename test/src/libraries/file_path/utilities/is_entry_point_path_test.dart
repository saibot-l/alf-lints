import 'package:alf_lints/src/libraries/file_path/utilities/is_entry_point_path.dart';
import 'package:test/test.dart';

void main() {
  group('isEntryPointPath', () {
    const packageName = 'some_package-name';

    test('should return `false` when the absolute path is `null`', () {
      expect(
        isEntryPointPath(null, packageName: packageName),
        isFalse,
      );
    });

    test(
        'should return `false` when the absolute path does not contain package name',
        () {
      expect(
        isEntryPointPath('lib/main.dart', packageName: packageName),
        isFalse,
      );
    });

    test(
        'should return `false` when the absolute path does not point to a valid entry point',
        () {
      expect(
        isEntryPointPath(
          '$packageName/lib/bin/main.dart',
          packageName: packageName,
        ),
        isFalse,
      );
      expect(
        isEntryPointPath(
          '$packageName/lib/src/main.dart',
          packageName: packageName,
        ),
        isFalse,
      );
    });

    test(
        'should return `true` when the absolute path points to a valid entry point in `bin`',
        () {
      expect(
        isEntryPointPath(
          '$packageName/bin/main.dart',
          packageName: packageName,
        ),
        isTrue,
      );
      expect(
        isEntryPointPath(
          '$packageName/bin/main_dev.dart',
          packageName: packageName,
        ),
        isTrue,
      );
      expect(
        isEntryPointPath(
          '$packageName/bin/$packageName.dart',
          packageName: packageName,
        ),
        isTrue,
      );
      expect(
        isEntryPointPath(
          '$packageName/bin/custom.dart',
          packageName: packageName,
        ),
        isTrue,
      );
    });

    test(
        'should return `true` when the absolute path points to a valid entry point in `lib`',
        () {
      expect(
        isEntryPointPath(
          '$packageName/lib/main.dart',
          packageName: packageName,
        ),
        isTrue,
      );
      expect(
        isEntryPointPath(
          '$packageName/lib/main_dev.dart',
          packageName: packageName,
        ),
        isTrue,
      );
      expect(
        isEntryPointPath(
          '$packageName/lib/$packageName.dart',
          packageName: packageName,
        ),
        isTrue,
      );
      expect(
        isEntryPointPath(
          '$packageName/lib/custom.dart',
          packageName: packageName,
        ),
        isTrue,
      );
    });
  });
}
