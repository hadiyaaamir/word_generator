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
              child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child: Wrap(
                    key: Key('${word.isSwitched}'),
                    children: [
                      Text(
                        word.word.first.toLowerCase(),
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: colorScheme.primaryContainer,
                                  fontWeight: FontWeight.w300,
                                ),
                      ),
                      Text(
                        word.word.second.toLowerCase(),
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  context.read<WordController>().switchWord();
                },
                icon: Icon(Icons.swap_horiz,
                    size: 17, color: colorScheme.onPrimary),
              ),
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
