part of 'view.dart';

class WordsList extends StatefulWidget {
  const WordsList({super.key});

  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final WordController wordController = context.watch<WordController>();
    wordController.wordListKey = _listKey;

    List<Word> words = wordController.previousWords;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      sliver: SliverAnimatedList(
        key: _listKey,
        // reverse: true,
        initialItemCount: words.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: SmallWordTile(
              word: words[index],
              key: Key('${words[index].word}'),
            ),
          );
        },
      ),
    );
  }
}
