part of 'view.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WordPair> favs = context.watch<WordController>().favourites;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView.builder(
        itemCount: favs.length,
        itemBuilder: (BuildContext context, int index) {
          return FavouriteTile(word: favs[index]);
        },
      ),
    );
  }
}
