part of 'view.dart';

class WordTile extends StatefulWidget {
  const WordTile({super.key});

  @override
  State<WordTile> createState() => WordTileState();
}

class WordTileState extends State<WordTile> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      child: Card(
        color: colorScheme.primary,
        elevation: 3,
        child: const Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: AnimatedWord(),
            ),
            Positioned(
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

class AnimatedWord extends StatelessWidget {
  const AnimatedWord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AnimatedSizer(
      child: AnimatedScaleAndFade(
        child: AnimatedSlidingOffWidget(),
      ),
    );
  }
}
