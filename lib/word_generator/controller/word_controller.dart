part of 'controller.dart';

class WordController extends ChangeNotifier {
  final int _currentIndex = 0;

  Word get current => _words[_currentIndex];
  set current(Word word) => _words[_currentIndex] = word;

  final List<Word> _words = [Word(word: WordPair.random())];
  List<Word> get words => _words.sublist(1);

  List<Word> get favourites =>
      _words.where((word) => word.isFavourite).toList();

  bool get isCurrentFavourite => isFav(current);

  bool isFav(Word word) => word.isFavourite;

  GlobalKey? wordListKey;

  void getNext() {
    _words.insert(_currentIndex, Word(word: WordPair.random()));

    AnimatedListState? animatedList =
        wordListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(_currentIndex);

    notifyListeners();
  }

  void toggleCurrentFavourite() {
    current = current.toggleFavourite();
    notifyListeners();
  }

  void toggleFavourite(Word word) {
    int index = _words.indexOf(word);
    if (index != -1) {
      _words[index] = word.toggleFavourite();
    }
    notifyListeners();
  }

  void swapWords() {
    current = current.swapWords();
    notifyListeners();
  }
}
