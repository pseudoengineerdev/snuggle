import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_palette.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/presentation/constants/constants.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({
    super.key,
    required this.palette,
    required this.onOpenMood,
  });

  final SnugglePalette palette;
  final VoidCallback onOpenMood;

  @override
  Widget build(BuildContext context) {
    final tokens = snuggleTokens(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            tokens.heroGradientStart.withValues(alpha: 0.2),
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 32),
        children: <Widget>[
          _HeroCard(palette: palette),
          const SizedBox(height: 14),
          const _SharedHouseCard(),
          const SizedBox(height: 14),
          _MoodRitualCard(onOpenMood: onOpenMood),
          const SizedBox(height: 14),
          const _CompanionCard(),
          const SizedBox(height: 14),
          const _QuickActionsCard(),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.palette});

  final SnugglePalette palette;

  @override
  Widget build(BuildContext context) {
    final tokens = snuggleTokens(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[tokens.heroGradientStart, tokens.heroGradientEnd],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.favorite_rounded, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                'Aarav + Maya',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '412 Days Together',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '7.2 mi apart right now. Last update 3m ago.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: <Widget>[
              _HeroStatPill(
                icon: Icons.pets_rounded,
                label: 'Companion',
                value: 'Happy',
                palette: palette,
              ),
              const SizedBox(width: 10),
              _HeroStatPill(
                icon: Icons.star_rounded,
                label: 'Stars',
                value: '1,280',
                palette: palette,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroStatPill extends StatelessWidget {
  const _HeroStatPill({
    required this.icon,
    required this.label,
    required this.value,
    required this.palette,
  });

  final IconData icon;
  final String label;
  final String value;
  final SnugglePalette palette;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: palette.isDark
              ? Colors.black.withValues(alpha: 0.16)
              : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.32)),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.88),
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SharedHouseCard extends StatelessWidget {
  const _SharedHouseCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SnuggleSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Shared House',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.secondary.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Cozy Lv 4',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Your shared home world. Buy items and place them room by room.',
            style: TextStyle(color: snuggleTokens(context).mutedText),
          ),
          const SizedBox(height: 14),
          const _RoomRow(
            room: 'Living Room / Hall',
            status: 'Unlocked',
            items: '3 items placed',
            icon: Icons.weekend_rounded,
          ),
          const SizedBox(height: 8),
          const _RoomRow(
            room: 'Bedroom',
            status: 'Unlocked',
            items: '2 items placed',
            icon: Icons.king_bed_rounded,
          ),
          const SizedBox(height: 8),
          const _RoomRow(
            room: 'Kitchen',
            status: 'Locked',
            items: 'Unlock at Cozy Lv 5',
            icon: Icons.kitchen_rounded,
          ),
          const SizedBox(height: 8),
          const _RoomRow(
            room: 'Bathroom',
            status: 'Locked',
            items: 'Unlock at Cozy Lv 6',
            icon: Icons.bathtub_rounded,
          ),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_home_work_rounded),
                  label: const Text('Place Item'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.storefront_rounded),
                  label: const Text('Visit Shop'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoomRow extends StatelessWidget {
  const _RoomRow({
    required this.room,
    required this.status,
    required this.items,
    required this.icon,
  });

  final String room;
  final String status;
  final String items;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final unlocked = status == 'Unlocked';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: snuggleTokens(context).border),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(room, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(items, style: TextStyle(color: snuggleTokens(context).mutedText)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: unlocked
                  ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.22)
                  : Theme.of(context).colorScheme.error.withValues(alpha: 0.15),
            ),
            child: Text(
              status,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoodRitualCard extends StatelessWidget {
  const _MoodRitualCard({required this.onOpenMood});

  final VoidCallback onOpenMood;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SnuggleSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Daily Mood Ritual',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            'Check in fast from Home and keep your partner emotionally updated.',
            style: TextStyle(color: snuggleTokens(context).mutedText),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: moodOptions
                .take(homeMoodChipCount)
                .map((mood) => Chip(label: Text(mood)))
                .toList(),
          ),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_rounded),
                  label: const Text('Send Mood Check-In'),
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: onOpenMood,
                child: const Text('Open Full'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CompanionCard extends StatelessWidget {
  const _CompanionCard();

  @override
  Widget build(BuildContext context) {
    final tokens = snuggleTokens(context);

    return SnuggleSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Shared Companion',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'Healthy',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'MVP companion: one original creature. Missed care warnings start gently and never punish during outages.',
            style: TextStyle(color: tokens.mutedText),
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.restaurant_rounded),
                  label: const Text('Feed'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sports_esports_rounded),
                  label: const Text('Play'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bedtime_rounded),
                  label: const Text('Rest'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionsCard extends StatelessWidget {
  const _QuickActionsCard();

  @override
  Widget build(BuildContext context) {
    return SnuggleSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Quick Affection',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                const <(IconData, String)>[
                  (Icons.waving_hand_rounded, 'Thinking of you'),
                  (Icons.wb_sunny_rounded, 'Good morning'),
                  (Icons.nightlight_round_rounded, 'Good night'),
                  (Icons.favorite_border_rounded, 'Miss you'),
                  (Icons.coffee_rounded, 'Coffee gift'),
                ].map((entry) {
                  return ActionChip(
                    avatar: Icon(entry.$1, size: 18),
                    label: Text(entry.$2),
                    onPressed: () {},
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
