import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/presentation/constants/constants.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/step_card.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

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
                'Games Hub',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'Daily prompts and lightweight couple activities.',
                style: TextStyle(color: snuggleTokens(context).mutedText),
              ),
              const SizedBox(height: 12),
              const Text('What place should we visit together in the next 6 months?'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    gameCategories.map((item) => Chip(label: Text(item))).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        const StepCard(
          step: 'Mini Game',
          title: 'This Or That',
          body: 'Turn-based quick choice game that can be played asynchronously.',
        ),
      ],
    );
  }
}
