import 'package:alf_lints/src/libraries/utilities/call_once.dart';
import 'package:test/test.dart';

void main() {
  group('CallOnce', () {
    test('should call the provided function only once', () {
      int callCount = 0;
      void call() => callCount++;
      final callOnce = CallOnce();

      expect(callCount, equals(0));

      callOnce(call);
      expect(callCount, equals(1));

      callOnce(call);
      expect(callCount, equals(1));
    });
  });
}
