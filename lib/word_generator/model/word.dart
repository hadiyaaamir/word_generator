part of 'model.dart';

@immutable
class Word {
  const Word({
    required this.word,
    this.isFav = false,
    this.isSwitched = false,
  });

  final WordPair word;
  final bool isFav;
  final bool isSwitched;

  Word copyWith({WordPair? word, bool? isFav, bool? isSwitched}) => Word(
        word: word ?? this.word,
        isFav: isFav ?? this.isFav,
        isSwitched: isSwitched ?? this.isSwitched,
      );

  Word toggleFav() => copyWith(isFav: !isFav);

  Word switchAround() => copyWith(
        word: WordPair(word.second, word.first),
        isSwitched: !isSwitched,
      );

  @override
  String toString() {
    return '$word';
  }
}
