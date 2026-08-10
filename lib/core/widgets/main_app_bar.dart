part of '_widgets.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLogo;
  final String? label;
  final bool showNotification;
  final VoidCallback? onNotificationTap;

  const MainAppBar({
    super.key,
    this.showLogo = false,
    this.label,
    this.showNotification = false,
    this.onNotificationTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 72,
      elevation: 3.0,
      shadowColor: const Color.fromARGB(108, 0, 0, 0),
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      title: showLogo
          ? SvgPicture.asset("assets/icons/fisiomate-full.svg", height: 32)
          : (label != null ? Text(label!) : null),
      actions: [
        if (showNotification)
          IconButton(
            onPressed: onNotificationTap,
            icon: SvgPicture.asset("assets/icons/notification-icon.svg"),
          ),
      ],
    );
  }
}
