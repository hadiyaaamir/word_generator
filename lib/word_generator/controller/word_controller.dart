part of 'controller.dart';

class WordController extends ChangeNotifier {
  Word get current => _words[_words.length - 1];
  set current(Word word) => _words[_words.length - 1] = word;

  final List<Word> _words = [Word(word: WordPair.random())];
  List<Word> get words => _words.sublist(0, _words.length - 1);

  List<Word> get favourites => _words.where((word) => word.isFav).toList();

  bool get isCurrentFav => isFav(current);

  bool isFav(Word word) => word.isFav;

  void getNext() {
    _words.add(Word(word: WordPair.random()));
    notifyListeners();
  }

  void toggleCurrentFavourite() {
    current = current.toggleFav();
    notifyListeners();
  }

  void toggleFavourite(Word word) {
    int index = _words.indexOf(word);
    if (index != -1) {
      _words[index] = word.toggleFav();
    }
    notifyListeners();
  }

  void switchWord() {
    current = current.switchAround();
    notifyListeners();
  }
}
