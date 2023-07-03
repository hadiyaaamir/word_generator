part of 'view.dart';

class FavouriteTile extends StatelessWidget {
  const FavouriteTile({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, right: 35, left: 35),
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
              context.read<WordController>().toggleFavourite(word);
            },
            child: Icon(Icons.delete,
                color: Theme.of(context).colorScheme.primary, size: 20),
          ),
        ),
      ),
    );
  }
}
