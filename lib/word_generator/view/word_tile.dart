part of 'view.dart';

class WordTile extends StatelessWidget {
  const WordTile({super.key});

  @override
  Widget build(BuildContext context) {
    Word word = context.watch<WordController>().current;
    return GestureDetector(
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 3,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                word.word.asLowerCase,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                semanticsLabel: '${word.word.first} ${word.word.second}',
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () => context.read<WordController>().switchWord(),
                icon: Icon(
                  Icons.swap_horiz,
                  size: 17,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
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
