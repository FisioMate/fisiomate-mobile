part of '_widgets.dart';

class NavBarItem {
  final Widget icon;
  final String label;
  final String route;

  const NavBarItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  static final List<NavBarItem> items = [
    NavBarItem(
      icon: SvgPicture.asset("assets/icons/home-icon.svg"),
      label: "Beranda",
      route: "/",
    ),
    NavBarItem(
      icon: SvgPicture.asset("assets/icons/progress-icon.svg"),
      label: "Progress",
      route: "/progress",
    ),
    NavBarItem(
      icon: SvgPicture.asset("assets/icons/chat-icon.svg"),
      label: "Chat",
      route: "/chat",
    ),
    NavBarItem(
      icon: SvgPicture.asset("assets/icons/profile-icon.svg"),
      label: "Akun",
      route: "/profile",
    ),
  ];

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _activeIndex = 0;

  Widget _tintedIcon(Widget icon, Color color) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CircleNavBar(
      activeIndex: _activeIndex,
      onTap: (index) {
        setState(() => _activeIndex = index);
        context.go(NavBar.items[index].route);
      },
      iconCurve: Curves.easeOutCubic,
      tabCurve: Curves.easeOutCubic,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      circleShadowColor: BaseColors.primary.withValues(alpha: 0.35),
      activeIcons: NavBar.items
          .map((item) => Center(child: _tintedIcon(item.icon, Colors.white)))
          .toList(),
      inactiveIcons: NavBar.items
          .map(
            (item) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _tintedIcon(item.icon, BaseColors.textSecondary),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: FontTheme.labelSmall.copyWith(
                    color: BaseColors.textSecondary,
                  ),
                ),
              ],
            ),
          )
          .toList(),
      color: BaseColors.surface,
      circleColor: BaseColors.primary,
    );
  }
}
