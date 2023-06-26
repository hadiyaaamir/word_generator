part of 'view.dart';

class WordsList extends StatefulWidget {
  const WordsList({super.key, this.reverseList = false});

  final bool reverseList;

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

    wordController.reverseList = widget.reverseList;

    List<Word> words = widget.reverseList
        ? wordController.previousWords.reversed.toList()
        : wordController.previousWords;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      sliver: SliverAnimatedList(
        key: _listKey,
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
