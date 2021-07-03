import 'package:flutter/material.dart';
import 'package:hris_mobile/l10n/l10n.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    Key? key,
    required String address,
  })  : _address = address,
        super(key: key);

  final String _address;

  @override
  Widget build(BuildContext context) {
    final _l10n = context.l10n;
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          child: RichText(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.location_on,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(width: 3),
                ),
                TextSpan(
                  text: '${_l10n.location}: $_address',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
