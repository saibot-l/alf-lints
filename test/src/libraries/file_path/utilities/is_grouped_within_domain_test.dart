import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/utilities/is_grouped_within_domain.dart';
import 'package:test/test.dart';

void main() {
  group('isGroupedWithinDomain', () {
    test('should return `false` if the relative path is `null`', () {
      expect(isGroupedWithinDomain(null, FileDomain.libraries), isFalse);
    });

    test('should return `false` if the relative path does not match the domain',
        () {
      expect(
        isGroupedWithinDomain('/features/a/b.dart', FileDomain.libraries),
        isFalse,
      );
    });

    group('when the relative path does match the domain', () {
      test('should return `false` if there is no further nesting', () {
        expect(
          isGroupedWithinDomain('/libraries/a.dart', FileDomain.libraries),
          isFalse,
        );
      });

      test('should return `true` if there is further nesting', () {
        expect(
          isGroupedWithinDomain('/libraries/a/b.dart', FileDomain.libraries),
          isFalse,
        );
      });
    });
  });
}
