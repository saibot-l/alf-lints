import 'package:alf_lints/src/libraries/file_path/file_domain.dart';
import 'package:alf_lints/src/libraries/file_path/file_path.dart';
import 'package:test/test.dart';

void main() {
  group('FilePath', () {
    group('fromAbsolute', () {
      test('should construct file path with absolute and relative path', () {
        final filePath = FilePath.fromAbsolute(
          '.../lib/src/features/example_feature.dart',
        );

        expect(
          filePath.absolutePath,
          equals('.../lib/src/features/example_feature.dart'),
        );
        expect(filePath.relativePath, equals('features/example_feature.dart'));
      });
    });

    group('fromRelative', () {
      test('should construct file path with only relative path', () {
        final filePath = FilePath.fromRelative('features/example_feature.dart');

        expect(filePath.absolutePath, isNull);
        expect(filePath.relativePath, equals('features/example_feature.dart'));
      });
    });

    group('isEntryPointOf', () {
      final package = 'some_package_name';

      test(
        'should return `false` if absolute path does not point to an entry point',
        () {
          final filePath = FilePath.fromAbsolute(
            '.../$package/lib/src/features/example_feature.dart',
          );

          expect(filePath.isEntryPointOf(package), isFalse);
        },
      );

      test(
        'should return `true` if absolute path does point to an entry point',
        () {
          final filePath = FilePath.fromAbsolute(
            '.../$package/bin/$package.dart',
          );

          expect(filePath.isEntryPointOf(package), isTrue);
        },
      );
    });

    group('isGroupedIn', () {
      test(
        'should return `false` if relative path is not further nested in domain',
        () {
          final filePath = FilePath.fromRelative(
            'libraries/example_library.dart',
          );

          expect(filePath.isGroupedIn(FileDomain.libraries), isFalse);
        },
      );

      test(
        'should return `true` if relative path is further nested in domain',
        () {
          final filePath = FilePath.fromRelative(
            'libraries/example_library/example_library.dart',
          );

          expect(filePath.isGroupedIn(FileDomain.libraries), isTrue);
        },
      );
    });

    group('isPartOf', () {
      test(
        'should return `false` if relative path is not part of domain',
        () {
          final filePath = FilePath.fromRelative(
            'features/example_feature.dart',
          );

          expect(filePath.isPartOf(FileDomain.libraries), isFalse);
        },
      );

      test(
        'should return `true` if relative path is part of domain',
        () {
          final filePath = FilePath.fromRelative(
            'features/example_feature.dart',
          );

          expect(filePath.isPartOf(FileDomain.features), isTrue);
        },
      );
    });

    group('nameIn', () {
      test(
        'should extract name in domain from relative path',
        () {
          final filePath = FilePath.fromRelative(
            'features/example_feature.dart',
          );

          expect(
            filePath.nameIn(FileDomain.features),
            equals('example_feature'),
          );
        },
      );
    });
  });
}
