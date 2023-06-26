part of 'controller.dart';

class WordController extends ChangeNotifier {
  final int _currentIndex = 0;

  Word get current => _words[_currentIndex];
  set current(Word word) => _words[_currentIndex] = word;

  final List<Word> _words = [Word(word: WordPair.random())];
  List<Word> get previousWords => _words.sublist(1);

  List<Word> get favourites =>
      _words.where((word) => word.isFavourite).toList();

  bool get isCurrentFavourite => isFav(current);

  bool isFav(Word word) => word.isFavourite;

  bool reverseList = false;

  GlobalKey? wordListKey;
  GlobalKey? favouriteListKey;

  void getNext() {
    WordPair currentWord = WordPair.random();

    _words.insert(_currentIndex, Word(word: currentWord));
    _addToWordsAnimatedList();

    notifyListeners();
  }

  void _addToWordsAnimatedList() {
    SliverAnimatedListState? animatedList =
        wordListKey?.currentState as SliverAnimatedListState?;

    animatedList?.insertItem(
        reverseList ? previousWords.length - 1 - _currentIndex : _currentIndex);
  }

  void _removeFromFavouritesAnimatedList(int index) {
    AnimatedListState? animatedList =
        favouriteListKey?.currentState as AnimatedListState?;
    animatedList?.removeItem(index, (_, animation) {
      return SizeTransition(
          sizeFactor: animation, child: const TemporaryDeletionTile());
    }, duration: const Duration(milliseconds: 300));
  }

  void toggleCurrentFavourite() {
    current = current.toggleFavourite();
    notifyListeners();
  }

  void toggleFavourite(Word word) {
    int index = _words.indexOf(word);
    if (index != -1) {
      if (_words[index].isFavourite) _removeFavourites(word);
      _words[index] = word.toggleFavourite();
    }
    notifyListeners();
  }

  void _removeFavourites(Word word) {
    List favouriteWord =
        favourites.where((element) => element.word == word.word).toList();

    if (favouriteWord.isNotEmpty) {
      int favouriteIndex = favourites.indexOf(favouriteWord.first);
      _removeFromFavouritesAnimatedList(favouriteIndex);
    }
  }

  void swapWords() {
    if (!current.isSwitched) {
      _addToWordsAnimatedList();
      _words.insert(_currentIndex, current);
      current = current.swapWords();
    }
    notifyListeners();
  }
}
