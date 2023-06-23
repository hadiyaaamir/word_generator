part of 'widgets.dart';

class CurrentWord extends StatelessWidget {
  const CurrentWord({super.key});

  @override
  Widget build(BuildContext context) {
    Word word = context.watch<WordController>().current;
    var colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      children: [
        Text(
          word.word.first.toLowerCase(),
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.w300,
              ),
        ),
        Text(
          word.word.second.toLowerCase(),
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
