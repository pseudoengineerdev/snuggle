import 'package:flutter/material.dart';
import 'package:snuggle_mobile/features/home/presentation/constants/constants.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/core_screen_scaffold.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class MoodCheckInPage extends StatelessWidget {
  const MoodCheckInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreScreenScaffold(
      title: 'Mood Check-In',
      subtitle: 'Daily emotional update with partner reaction flow.',
      children: <Widget>[
        SnuggleSurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('How are you feeling?', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: moodOptions.map((mood) => Chip(label: Text(mood))).toList(),
              ),
              const SizedBox(height: 12),
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Optional note for your partner...',
                ),
              ),
              const SizedBox(height: 12),
              const FilledButton(onPressed: null, child: Text('Save Mood')),
            ],
          ),
        ),
      ],
    );
  }
}
