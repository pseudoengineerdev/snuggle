import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/presentation/widgets/chat_bubble.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.onOpenGamesTab});

  final VoidCallback onOpenGamesTab;

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
                'Private Couple Chat',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'A private, intimate conversation space for couples.',
                style: TextStyle(color: snuggleTokens(context).mutedText),
              ),
              const SizedBox(height: 12),
              const ChatBubble(
                sender: 'Maya',
                message: 'I added a new photo to our timeline. Check memories.',
                incoming: true,
              ),
              const SizedBox(height: 10),
              const ChatBubble(
                sender: 'You',
                message: 'Love it. Sending a coffee gift now.',
                incoming: false,
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
                'Daily Question Card',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              const Text('What is one thing your partner did this week that made you smile?'),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: onOpenGamesTab,
                child: const Text('Open Games Tab'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
