part of '_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(showLogo: true, showNotification: true),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            MainButton(
              label: "Primary",
              onPressed: () {},
              leftIcon: Icon(Icons.people),
            ),
            MainButton(
              label: "Primary Outlined",
              styleType: ButtonStyleType.outlined,
              onPressed: () {},
              leftIcon: Icon(Icons.verified_user),
            ),
            MainButton(
              label: "Secondary",
              variant: ButtonVariant.secondary,
              onPressed: () {},
              leftIcon: Icon(Icons.search),
            ),
            MainButton(
              label: "Secondary Outlined",
              variant: ButtonVariant.secondary,
              styleType: ButtonStyleType.outlined,
              onPressed: () {},
              leftIcon: Icon(Icons.ac_unit),
            ),
            MainButton(
              label: "Error",
              variant: ButtonVariant.error,
              onPressed: () {},
              leftIcon: Icon(Icons.error),
            ),
            MainButton(
              label: "Error Outlined",
              variant: ButtonVariant.error,
              styleType: ButtonStyleType.outlined,
              onPressed: () {},
              leftIcon: Icon(Icons.nearby_error),
            ),
            MainButton(label: "Disabled", leftIcon: Icon(Icons.nearby_error)),
          ],
        ),
      ),
    );
  }
}
