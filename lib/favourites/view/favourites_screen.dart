part of 'view.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Word> favourites = [];

  late final WordController wordController;

  @override
  void initState() {
    super.initState();
    wordController = context.read<WordController>();
    wordController.addListener(_handleWordControllerChange);
    favourites.addAll(wordController.favourites);
  }

  @override
  void dispose() {
    wordController.removeListener(_handleWordControllerChange);
    super.dispose();
  }

  void _handleWordControllerChange() {
    final List<Word> newFavourites = wordController.favourites;

    // Find removed favourites
    final List<Word> removedFavourites = favourites
        .where((favourite) => !newFavourites.contains(favourite))
        .toList();

    // Remove favourites from the animated list
    for (var removedFavourite in removedFavourites) {
      final int index = favourites.indexOf(removedFavourite);
      final AnimatedListState? animatedList = _listKey.currentState;
      animatedList?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: FavouriteTile(word: removedFavourite),
        ),
        duration: const Duration(milliseconds: 300),
      );
    }

    setState(() {
      favourites.clear();
      favourites.addAll(newFavourites);
    });
  }

  @override
  Widget build(BuildContext context) {
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
