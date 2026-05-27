import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/presentation/constants/constants.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/calendar_event_row.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/date_row.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class MemoriesPage extends StatelessWidget {
  const MemoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 24),
      children: <Widget>[
        SnuggleSurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Memories Timeline',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'Photos, captions, calendar rituals, and important dates in one place.',
                style: TextStyle(color: snuggleTokens(context).mutedText),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: memoryTags.map((tag) => Chip(label: Text(tag))).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        const _MemoryEventCard(
          title: 'Rooftop Dinner',
          detail: 'May 19 • 8 days ago • Chicago',
          caption: 'The sunset looked fake, and we still talked for 3 hours.',
        ),
        const SizedBox(height: 10),
        const _MemoryEventCard(
          title: 'Airport Reunion',
          detail: 'April 11 • 45 days ago • JFK',
          caption: 'Best hug of the year so far.',
        ),
        const SizedBox(height: 14),
        SnuggleSurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Calendar',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'Mood history and ritual moments are grouped with memories.',
                style: TextStyle(color: snuggleTokens(context).mutedText),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: snuggleTokens(context).border),
                ),
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today_rounded),
                    SizedBox(width: 10),
                    Expanded(child: Text('May 2026 Mood Streak: 21 check-ins')),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const CalendarEventRow(
                time: '08:00 PM',
                title: 'Date Night Prompt',
                subtitle: 'Romantic category',
              ),
              const SizedBox(height: 8),
              const CalendarEventRow(
                time: '09:00 PM',
                title: 'Companion Care Reminder',
                subtitle: 'Feed and rest together',
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SnuggleSurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Important Dates',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              const DateRow(
                title: 'Anniversary',
                subtitle: 'June 12',
                trailing: '16 days',
              ),
              Divider(color: snuggleTokens(context).border, height: 22),
              const DateRow(
                title: 'Next Date Night Ritual',
                subtitle: 'Friday • 8:00 PM',
                trailing: '2 days',
              ),
              Divider(color: snuggleTokens(context).border, height: 22),
              const DateRow(
                title: 'Maya Birthday',
                subtitle: 'July 8',
                trailing: '43 days',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MemoryEventCard extends StatelessWidget {
  const _MemoryEventCard({
    required this.title,
    required this.detail,
    required this.caption,
  });

  final String title;
  final String detail;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return SnuggleSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          Text(detail, style: TextStyle(color: snuggleTokens(context).mutedText)),
          const SizedBox(height: 10),
          Text(caption),
        ],
      ),
    );
  }
}
