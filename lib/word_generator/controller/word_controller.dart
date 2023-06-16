part of 'controller.dart';

class WordController extends ChangeNotifier {
  var current = WordPair.random();

  final List<WordPair> _favourites = [];
  List<WordPair> get favourites => _favourites;

  bool get isFav => _favourites.contains(current);
  bool isLiked(WordPair word) => favourites.contains(word);

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavourites() {
    isFav ? _favourites.remove(current) : _favourites.add(current);
    notifyListeners();
  }

  void removeWord(WordPair word) {
    _favourites.remove(word);
    notifyListeners();
  }
}
