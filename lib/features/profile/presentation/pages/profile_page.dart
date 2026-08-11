part of '_pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Ini profile page cuii"),
          const SizedBox(height: 16),
          // TODO: temporary — replace once the real profile page exists.
          MainButton(
            label: "Logout",
            variant: ButtonVariant.error,
            styleType: ButtonStyleType.outlined,
            onPressed: () async {
              await context.read<AuthRepository>().logout();
              if (context.mounted) context.go('/auth');
            },
          ),
        ],
      ),
    );
  }
}
