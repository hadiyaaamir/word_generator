part of 'view.dart';

class WordTile extends StatelessWidget {
  const WordTile({
    super.key,
    required this.word,
  });

  final WordPair word;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          child: Text(
            word.asLowerCase,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            semanticsLabel: '${word.first} ${word.second}',
          ),
        ),
      ),
    );
  }
}
