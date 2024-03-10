import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/is_path_of_domain.dart';
import 'package:test/test.dart';

void main() {
  group('isPathOfDomain', () {
    test('returns `false` when the relative path is `null`', () {
      expect(isPathOfDomain(null, FileDomain.features), isFalse);
    });

    test('returns `false` when the relative path is not matching the domain',
        () {
      expect(isPathOfDomain('features/a.dart', FileDomain.app), isFalse);
    });

    test('returns `true` when the relative path does match the domain', () {
      expect(isPathOfDomain('features/a.dart', FileDomain.features), isTrue);
    });
  });
}
