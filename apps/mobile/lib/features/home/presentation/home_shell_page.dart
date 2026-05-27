import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_palette.dart';
import 'package:snuggle_mobile/app/theme/snuggle_palettes.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/chat_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/games_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/home_dashboard_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/memories_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/mood_check_in_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/settings_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/subscription_billing_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/user_profile_page.dart';

enum CoreScreenDestination {
  userProfile,
  mood,
  subscriptionBilling,
}

class HomeShellPage extends StatefulWidget {
  const HomeShellPage({
    super.key,
    required this.activePaletteId,
    required this.onPaletteChanged,
  });

  final String activePaletteId;
  final ValueChanged<String> onPaletteChanged;

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _currentIndex = 0;

  static const List<String> _tabs = <String>[
    'Home',
    'Chat',
    'Memories',
    'Games',
    'Settings',
  ];

  static const List<IconData> _tabIcons = <IconData>[
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.photo_album_rounded,
    Icons.sports_esports_rounded,
    Icons.settings_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final palette = SnugglePalettes.byId(widget.activePaletteId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Snuggle',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              _tabs[_currentIndex],
              style: TextStyle(
                fontSize: 13,
                color: snuggleTokens(context).mutedText,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                _openCoreScreen(CoreScreenDestination.subscriptionBilling),
            tooltip: 'Subscription',
            icon: const Icon(Icons.workspace_premium_rounded),
          ),
          TextButton.icon(
            onPressed: () => _showThemePicker(context),
            icon: const Icon(Icons.auto_awesome_rounded),
            label: const Text('Theme'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomeDashboardPage(
            palette: palette,
            onOpenMood: () => _openCoreScreen(CoreScreenDestination.mood),
          ),
          ChatPage(onOpenGamesTab: _goToGamesTab),
          const MemoriesPage(),
          const GamesPage(),
          SettingsPage(
            onOpenUserProfile: () =>
                _openCoreScreen(CoreScreenDestination.userProfile),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        destinations: List<NavigationDestination>.generate(
          _tabs.length,
          (index) => NavigationDestination(
            icon: Icon(_tabIcons[index]),
            label: _tabs[index],
          ),
        ),
      ),
    );
  }

  void _goToGamesTab() {
    setState(() {
      _currentIndex = 3;
    });
  }

  void _openCoreScreen(CoreScreenDestination destination) {
    Widget page;

    switch (destination) {
      case CoreScreenDestination.userProfile:
        page = const UserProfilePage();
        break;
      case CoreScreenDestination.mood:
        page = const MoodCheckInPage();
        break;
      case CoreScreenDestination.subscriptionBilling:
        page = const SubscriptionBillingPage();
        break;
    }

    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) => page),
    );
  }

  Future<void> _showThemePicker(BuildContext context) async {
    final nextPaletteId = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            children: <Widget>[
              const Text(
                'Choose Your Theme',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                'Personal theme changes now. Shared House styling will be couple-level settings.',
                style: TextStyle(color: snuggleTokens(context).mutedText),
              ),
              const SizedBox(height: 12),
              ...SnugglePalettes.all.map((palette) {
                final selected = palette.id == widget.activePaletteId;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: selected
                            ? Theme.of(context).colorScheme.primary
                            : snuggleTokens(context).border,
                        width: selected ? 1.8 : 1,
                      ),
                    ),
                    leading: _ThemeDot(palette: palette),
                    title: Text(
                      palette.label,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      selected
                          ? 'Selected'
                          : palette.isDark
                          ? 'Night mode'
                          : 'Day mode',
                    ),
                    trailing: selected
                        ? Icon(
                            Icons.check_circle_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : null,
                    onTap: () => Navigator.of(sheetContext).pop(palette.id),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );

    if (nextPaletteId != null && nextPaletteId != widget.activePaletteId) {
      widget.onPaletteChanged(nextPaletteId);
    }
  }
}

class _ThemeDot extends StatelessWidget {
  const _ThemeDot({required this.palette});

  final SnugglePalette palette;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: <Color>[palette.heroGradientStart, palette.heroGradientEnd],
          ),
          border: Border.all(color: snuggleTokens(context).border),
        ),
      ),
    );
  }
}
