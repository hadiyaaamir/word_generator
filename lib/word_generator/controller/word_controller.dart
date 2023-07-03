part of 'controller.dart';

class WordController extends ChangeNotifier {
  final int _currentIndex = 0;

  Word get current => _words[_currentIndex];
  set current(Word word) => _words[_currentIndex] = word;

  final List<Word> _words = [Word(word: WordPair.random())];
  List<Word> get previousWords => _words.sublist(1);

  List<Word> get favourites =>
      _words.where((word) => word.isFavourite).toList();

  bool get isCurrentFavourite => isFavourite(current);
  bool isFavourite(Word word) => word.isFavourite;

  GlobalKey wordTileKey = GlobalKey();

  void getNext() {
    WordPair currentWord = WordPair.random();

    _words.insert(_currentIndex, Word(word: currentWord));
    _slideWordOffWordTile();

    notifyListeners();
  }

  void _slideWordOffWordTile() {
    AnimatedSlidingOffWidgetState? wordTile =
        wordTileKey.currentState as AnimatedSlidingOffWidgetState;
    wordTile.slideOff();
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
    if (!current.isSwapped) {
      _words.insert(_currentIndex, current);
      current = current.swapWords();
      _slideWordOffWordTile();
    }
    notifyListeners();
  }
}
