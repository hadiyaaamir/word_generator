part of 'view.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final WordController wordController = context.watch<WordController>();
    wordController.favouriteListKey = _listKey;

    List<Word> favourites = wordController.favourites;

    return favourites.isEmpty
        ? const Center(child: Text('No favourites added'))
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: AnimatedList(
              key: _listKey,
              initialItemCount: favourites.length,
              itemBuilder: (context, index, animation) {
                return FavouriteTile(word: favourites[index]);
              },
            ),
          );
  }
}
