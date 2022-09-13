import 'package:fluent_ui/fluent_ui.dart';

class NumberOfBombsText extends StatelessWidget {
  const NumberOfBombsText({
    Key? key,
    required this.numberOfBombs,
  }) : super(key: key);

  final int numberOfBombs;

  @override
  Widget build(BuildContext context) {
    return Text(
      numberOfBombs.toString(),
      style: TextStyle(
        fontSize: 10,
        color: numberOfBombs == 1
            ? Colors.blue
            : numberOfBombs == 2
                ? Colors.purple
                : Colors.red,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
