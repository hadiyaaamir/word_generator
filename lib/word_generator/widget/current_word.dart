part of 'widget.dart';

class CurrentWord extends StatelessWidget {
  const CurrentWord({super.key, required this.word, required this.textStyle});
  final Word word;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    // Word word = context.watch<WordController>().current;
    // var colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      children: [
        Text(
          word.word.first.toLowerCase(),
          style: textStyle.copyWith(fontWeight: FontWeight.w300),
        ),
        Text(
          word.word.second.toLowerCase(),
          style: textStyle.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
