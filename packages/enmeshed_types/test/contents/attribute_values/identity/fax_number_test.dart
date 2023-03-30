import 'package:enmeshed_types/enmeshed_types.dart';
import 'package:test/test.dart';

void main() {
  const identityAttributeValue = FaxNumber(value: '0123456789');
  group('FaxNumber toJson', () {
    test('is correctly converted', () {
      final identityJson = identityAttributeValue.toJson();
      expect(
        identityJson,
        equals({
          '@type': 'FaxNumber',
          'value': '0123456789',
        }),
      );
    });
  });

  group('FaxNumber fromJson', () {
    test('is correctly converted', () {
      final json = {'value': '0123456789'};
      expect(FaxNumber.fromJson(json), equals(identityAttributeValue));
    });
  });
}
