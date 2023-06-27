part of 'view.dart';

class WordTile extends StatefulWidget {
  const WordTile({super.key});

  @override
  State<WordTile> createState() => WordTileState();
}

class WordTileState extends State<WordTile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
                  child: AnimatedSlidingOffWidget(
                    key: context.read<WordController>().wordTileKey,
                  ),
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
