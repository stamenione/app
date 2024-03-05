import 'package:enmeshed_types/enmeshed_types.dart';
import 'package:flutter/material.dart';
import 'package:translated_text/translated_text.dart';

import '../value_hint_translation.dart';

class PostOfficeBoxAddressAttributeRenderer extends StatelessWidget {
  final PostOfficeBoxAddressAttributeValue value;
  final ValueHints valueHints;
  final bool showTitle;
  final TextStyle valueTextStyle;
  final Widget? trailing;

  const PostOfficeBoxAddressAttributeRenderer({
    super.key,
    required this.value,
    required this.valueHints,
    required this.showTitle,
    required this.valueTextStyle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showTitle)
                TranslatedText(
                  'i18n://attributes.values.${value.atType}._title',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF42474E)),
                ),
              TranslatedText(value.recipient, style: valueTextStyle),
              TranslatedText(value.boxId, style: valueTextStyle),
              Row(
                children: [
                  TranslatedText(value.zipCode, style: valueTextStyle),
                  const SizedBox(width: 4),
                  TranslatedText(value.city, style: valueTextStyle),
                ],
              ),
              TranslatedText(valueHints.propertyHints!['country']!.getTranslation(value.country), style: valueTextStyle),
              if (value.state != null) TranslatedText(valueHints.propertyHints!['state']!.getTranslation(value.state), style: valueTextStyle),
            ],
          ),
        ),
        if (trailing != null) trailing!
      ],
    );
  }
}
