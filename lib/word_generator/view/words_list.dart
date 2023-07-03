part of 'view.dart';

class WordsList extends StatefulWidget {
  const WordsList({super.key});

  @override
  State<WordsList> createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  final List<Word> _words = [];

  late final WordController wordController;

  @override
  void initState() {
    super.initState();
    wordController = context.read<WordController>();
    wordController.addListener(_handleWordControllerChange);
    _words.addAll(wordController.previousWords);
  }

  void _handleWordControllerChange() {
    List previousWords = wordController.previousWords;

    if (previousWords.isNotEmpty) {
      final Word addedWord = previousWords.first;

      if (_words.isEmpty || addedWord.word != _words.first.word) {
        _addWordToAnimateList(addedWord);
      } else if (addedWord.word == _words.first.word) {
        setState(() {
          _words.clear();
          _words.addAll(wordController.previousWords);
        });
      }
    }
  }

  void _addWordToAnimateList(Word addedWord) {
    _words.insert(0, addedWord);
    final SliverAnimatedListState? animatedList = _listKey.currentState;
    animatedList?.insertItem(0, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    wordController.removeListener(_handleWordControllerChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      sliver: SliverAnimatedList(
        key: _listKey,
        initialItemCount: _words.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: SmallWordTile(
              word: _words[index],
              key: Key('${_words[index].word}'),
            ),
          );
        },
      ),
    );
  }
}
