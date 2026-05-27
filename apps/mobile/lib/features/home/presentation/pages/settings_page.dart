import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.onOpenUserProfile});

  final VoidCallback onOpenUserProfile;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _locationSharing = true;
  bool _batterySharing = true;
  bool _moodVisibility = true;
  bool _widgetVisibility = true;
  bool _questionReminder = true;

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
                'Settings + Privacy Center',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'Consent-first controls for partner-visible data.',
                style: TextStyle(color: snuggleTokens(context).mutedText),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: widget.onOpenUserProfile,
                icon: const Icon(Icons.person_rounded),
                label: const Text('Open User Profile'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SnuggleSurfaceCard(
          child: Column(
            children: <Widget>[
              SwitchListTile.adaptive(
                value: _locationSharing,
                contentPadding: EdgeInsets.zero,
                title: const Text('Location Sharing'),
                subtitle: const Text('Share last-known location and distance'),
                onChanged: (value) {
                  setState(() {
                    _locationSharing = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: _batterySharing,
                contentPadding: EdgeInsets.zero,
                title: const Text('Battery Sharing'),
                subtitle: const Text('Share partner battery status'),
                onChanged: (value) {
                  setState(() {
                    _batterySharing = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: _moodVisibility,
                contentPadding: EdgeInsets.zero,
                title: const Text('Mood Visibility'),
                subtitle: const Text('Show mood to partner widgets and chat'),
                onChanged: (value) {
                  setState(() {
                    _moodVisibility = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: _widgetVisibility,
                contentPadding: EdgeInsets.zero,
                title: const Text('Widget Visibility'),
                subtitle: const Text('Allow relationship widgets to refresh'),
                onChanged: (value) {
                  setState(() {
                    _widgetVisibility = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: _questionReminder,
                contentPadding: EdgeInsets.zero,
                title: const Text('Daily Question Reminder'),
                subtitle: const Text('Gentle reminders for couple rituals'),
                onChanged: (value) {
                  setState(() {
                    _questionReminder = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
