import 'package:flutter/material.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/core_screen_scaffold.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/step_card.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoreScreenScaffold(
      title: 'User Profile',
      subtitle: 'Personal identity and relationship summary.',
      children: <Widget>[
        _ProfileSummaryCard(),
        SizedBox(height: 14),
        StepCard(
          step: 'Relationship',
          title: 'Aarav + Maya',
          body: '412 days together, anniversary on June 12, long-distance enabled.',
        ),
        SizedBox(height: 14),
        StepCard(
          step: 'Privacy',
          title: 'Partner-Only Visibility',
          body: 'Sensitive details are visible only to your partner and can be removed anytime.',
        ),
      ],
    );
  }
}

class _ProfileSummaryCard extends StatelessWidget {
  const _ProfileSummaryCard();

  @override
  Widget build(BuildContext context) {
    return SnuggleSurfaceCard(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 28,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Text('S', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Sahil', style: TextStyle(fontWeight: FontWeight.w800)),
                Text('Nickname: Sky'),
                Text('Time zone: America/Detroit'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
