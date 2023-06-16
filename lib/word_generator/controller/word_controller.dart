part of 'controller.dart';

class WordController extends ChangeNotifier {
  var current = WordPair.random();

  final List<WordPair> _favourites = [];
  List<WordPair> get favourites => _favourites;

  bool get isFav => _favourites.contains(current);

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavourites() {
    isFav ? _favourites.remove(current) : _favourites.add(current);
    notifyListeners();
  }
}
