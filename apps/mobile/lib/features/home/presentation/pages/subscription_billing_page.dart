import 'package:flutter/material.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/core_screen_scaffold.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class SubscriptionBillingPage extends StatelessWidget {
  const SubscriptionBillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CoreScreenScaffold(
      title: 'Subscription + Billing',
      subtitle: 'Manage plans, billing, and premium features.',
      children: <Widget>[
        SnuggleSurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Current Plan', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text('Free Plan active. No ads. Core couple rituals included.'),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.receipt_long_rounded),
                label: const Text('View Billing History'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SnuggleSurfaceCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.workspace_premium_rounded, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  const Text('Premium Preview', style: TextStyle(fontWeight: FontWeight.w800)),
                ],
              ),
              const SizedBox(height: 8),
              const Text('Dual subscription model: each partner subscribes individually for premium features.'),
            ],
          ),
        ),
      ],
    );
  }
}
