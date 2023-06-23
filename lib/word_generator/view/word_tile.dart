part of 'view.dart';

class WordTile extends StatelessWidget {
  const WordTile({super.key});

  @override
  Widget build(BuildContext context) {
    Word word = context.watch<WordController>().current;
    var colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      child: Card(
        color: colorScheme.primary,
        elevation: 3,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: AnimatedSizer(
                child: AnimatedScaleAndFade(
                  child: CurrentWord(key: Key('${word.isSwitched}')),
                ),
              ),
            ),
            const Positioned(
              right: 0,
              child: SwapWordIconButton(),
            ),
          ],
        ),
      ),
      onDoubleTap: () {
        context.read<WordController>().toggleCurrentFavourite();
      },
    );
  }
}
