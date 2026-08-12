part of '_widgets.dart';

class PersonalizedGreeting extends StatelessWidget {
  final String name;
  final String quote;

  const PersonalizedGreeting({
    super.key,
    required this.name,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        SizedBox(width: double.infinity),
        Text(
          "Halo, $name!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          quote,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
