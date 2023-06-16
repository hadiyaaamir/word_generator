part of 'view.dart';

class FavouriteTile extends StatelessWidget {
  const FavouriteTile({super.key, required this.word});

  final WordPair word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          title: Text(
            word.toString(),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
