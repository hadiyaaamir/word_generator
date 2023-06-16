part of 'view.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Word> favs = context.watch<WordController>().favourites;
    print('favs: $favs');

    return favs.isEmpty
        ? const Center(child: Text('No favourites added'))
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: ListView.builder(
              itemCount: favs.length,
              itemBuilder: (BuildContext context, int index) {
                return FavouriteTile(word: favs[index]);
              },
            ),
          );
  }
}
