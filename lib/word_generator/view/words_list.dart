part of 'view.dart';

class WordsList extends StatelessWidget {
  WordsList({super.key});

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    List<Word> words = context.watch<WordController>().words.reversed.toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedList(
          key: listKey,
          initialItemCount: words.length,
          reverse: true,
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: SmallWordTile(word: words[index]),
            );
          }),
    );
  }
}
