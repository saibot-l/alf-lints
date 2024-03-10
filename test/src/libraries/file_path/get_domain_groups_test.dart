import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/get_domain_groups.dart';
import 'package:test/test.dart';

void main() {
  group('getDomainGroups', () {
    test('should return an empty array when the relative path is null', () {
      expect(getDomainGroups(null, FileDomain.libraries), equals([]));
    });

    test(
      'should return an empty array when the relative path does not match the domain',
      () {
        expect(
          getDomainGroups('features/a.dart', FileDomain.libraries),
          equals([]),
        );
      },
    );

    test('should return domain groups', () {
      expect(
        getDomainGroups('features/a/b/c.dart', FileDomain.features),
        equals([
          'a',
          'b',
          'c.dart',
        ]),
      );
    });
  });
}
