import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';

class CalendarEventRow extends StatelessWidget {
  const CalendarEventRow({
    super.key,
    required this.time,
    required this.title,
    required this.subtitle,
  });

  final String time;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 74,
          child: Text(
            time,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text(
                subtitle,
                style: TextStyle(color: snuggleTokens(context).mutedText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
