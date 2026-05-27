import 'package:flutter/material.dart';
import 'package:snuggle_mobile/app/theme/snuggle_theme.dart';
import 'package:snuggle_mobile/features/home/widgets/snuggle_surface_card.dart';

class OnboardingFlowPage extends StatefulWidget {
  const OnboardingFlowPage({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<OnboardingFlowPage> createState() => _OnboardingFlowPageState();
}

class _OnboardingFlowPageState extends State<OnboardingFlowPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _hasInvitedPartner = false;
  bool _partnerHasJoined = false;

  static const List<_OnboardingSlideData> _slides = <_OnboardingSlideData>[
    _OnboardingSlideData(
      title: 'Welcome To Snuggle',
      subtitle: 'A private, cozy world built for two.',
      body:
          'Create your shared relationship space with rituals, memories, and warmth.',
      icon: Icons.favorite_rounded,
    ),
    _OnboardingSlideData(
      title: 'Consent Comes First',
      subtitle: 'You both control what gets shared.',
      body:
          'Location, battery, mood, and widget visibility are opt-in and reversible at any time.',
      icon: Icons.verified_user_rounded,
    ),
    _OnboardingSlideData(
      title: 'Build Your Shared House',
      subtitle: 'Design rooms together, item by item.',
      body:
          'Start with hall/living room and bedroom, then unlock more spaces as your bond grows.',
      icon: Icons.home_work_rounded,
    ),
    _OnboardingSlideData(
      title: 'Invite Your Partner',
      subtitle: 'Link, QR, or manual code.',
      body: 'Partner invite and join are required before entering the app.',
      icon: Icons.group_add_rounded,
    ),
  ];

  bool get _isLastPage => _currentPage == _slides.length - 1;
  bool get _canEnterHome => _hasInvitedPartner && _partnerHasJoined;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
                    child: _OnboardingSlideCard(slide: slide),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 22),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_slides.length, (index) {
                      final bool active = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: active ? 26 : 8,
                        decoration: BoxDecoration(
                          color: active
                              ? Theme.of(context).colorScheme.primary
                              : snuggleTokens(context).border,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 14),
                  if (_isLastPage) ...<Widget>[
                    SnuggleSurfaceCard(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: <Widget>[
                          CheckboxListTile.adaptive(
                            contentPadding: EdgeInsets.zero,
                            value: _hasInvitedPartner,
                            title: const Text('Invite link shared with partner'),
                            subtitle: const Text('Generate link/QR and send it now.'),
                            onChanged: (value) {
                              setState(() {
                                _hasInvitedPartner = value ?? false;
                                if (!_hasInvitedPartner) {
                                  _partnerHasJoined = false;
                                }
                              });
                            },
                          ),
                          CheckboxListTile.adaptive(
                            contentPadding: EdgeInsets.zero,
                            value: _partnerHasJoined,
                            title: const Text('Partner has joined'),
                            subtitle: const Text('Confirmed through invite link or code.'),
                            onChanged: !_hasInvitedPartner
                                ? null
                                : (value) {
                                    setState(() {
                                      _partnerHasJoined = value ?? false;
                                    });
                                  },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _currentPage == 0
                              ? null
                              : () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 260),
                                    curve: Curves.easeOut,
                                  );
                                },
                          child: const Text('Back'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton(
                          onPressed: _isLastPage
                              ? (_canEnterHome ? widget.onFinished : null)
                              : () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 260),
                                    curve: Curves.easeOut,
                                  );
                                },
                          child: Text(_isLastPage ? 'Enter Snuggle' : 'Next'),
                        ),
                      ),
                    ],
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

class _OnboardingSlideData {
  const _OnboardingSlideData({
    required this.title,
    required this.subtitle,
    required this.body,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String body;
  final IconData icon;
}

class _OnboardingSlideCard extends StatelessWidget {
  const _OnboardingSlideCard({required this.slide});

  final _OnboardingSlideData slide;

  @override
  Widget build(BuildContext context) {
    return SnuggleSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                slide.icon,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            slide.title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(
            slide.subtitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            slide.body,
            style: TextStyle(color: snuggleTokens(context).mutedText),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
