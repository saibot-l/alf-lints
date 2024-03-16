import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/get_main_domain_group.dart';
import 'package:test/test.dart';

void main() {
  group('getMainDomainGroup', () {
    test('should return `null` when path is `null`', () {
      expect(getMainDomainGroup(null, FileDomain.libraries), isNull);
    });

    test(
      'should return `null` when relative path does not match the domain',
      () {
        expect(
          getMainDomainGroup(
            'libraries/some_feature.dart',
            FileDomain.libraries,
          ),
          isNull,
        );
      },
    );

    test('should return main domain group of folder', () {
      expect(
        getMainDomainGroup(
          'features/some_feature_directory/some_feature_file.dart',
          FileDomain.features,
        ),
        'some_feature_directory',
      );
    });

    test('should return main domain group of file', () {
      expect(
        getMainDomainGroup(
          'features/some_feature_file.dart',
          FileDomain.features,
        ),
        'some_feature_file',
      );
    });
  });
}
