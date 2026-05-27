import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_palette.dart';
import 'package:snuggle_mobile/app/theme/snuggle_palettes.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/presentation/home_shell_page.dart';
import 'package:snuggle_mobile/features/home/presentation/pages/onboarding_flow_page.dart';

class SnuggleApp extends StatefulWidget {
  const SnuggleApp({super.key});

  @override
  State<SnuggleApp> createState() => _SnuggleAppState();
}

class _SnuggleAppState extends State<SnuggleApp> {
  String _paletteId = SnugglePalettes.defaultId;
  bool _hasCompletedOnboarding = false;

  void _setPalette(String paletteId) {
    setState(() {
      _paletteId = paletteId;
    });
  }

  void _completeOnboarding() {
    setState(() {
      _hasCompletedOnboarding = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final SnugglePalette palette = SnugglePalettes.byId(_paletteId);

    return MaterialApp(
      title: 'Snuggle',
      debugShowCheckedModeBanner: false,
      theme: buildSnuggleTheme(palette),
      home: _hasCompletedOnboarding
          ? HomeShellPage(
              activePaletteId: _paletteId,
              onPaletteChanged: _setPalette,
            )
          : OnboardingFlowPage(onFinished: _completeOnboarding),
    );
  }
}
