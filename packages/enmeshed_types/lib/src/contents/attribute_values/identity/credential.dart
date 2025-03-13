import 'identity_attribute_value.dart';

class CredentialAttributeValue extends IdentityAttributeValue {
  final String value;

  const CredentialAttributeValue({required this.value}) : super('Credential');

  factory CredentialAttributeValue.fromJson(Map json) => CredentialAttributeValue(value: json['value']);

  @override
  Map<String, dynamic> toJson() => {'@type': super.atType, 'value': value};

  @override
  List<Object?> get props => [value];
}
