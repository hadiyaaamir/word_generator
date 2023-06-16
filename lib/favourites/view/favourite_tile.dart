part of 'view.dart';

class FavouriteTile extends StatelessWidget {
  const FavouriteTile({super.key, required this.word});

  final WordPair word;

  @override
  Widget build(BuildContext context) {
    // WordController wordController = context.watch<WordController>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          title: Text(
            word.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: GestureDetector(
            onTap: () {
              context.read<WordController>().removeWord(word);
            },
            child: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
