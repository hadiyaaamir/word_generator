part of 'model.dart';

@immutable
class Word {
  const Word({
    required this.word,
    this.isFav = false,
  });

  final WordPair word;
  final bool isFav;

  Word copyWith({WordPair? word, bool? isFav}) =>
      Word(word: word ?? this.word, isFav: isFav ?? this.isFav);

  Word toggleFav() => copyWith(isFav: !isFav);

  @override
  String toString() {
    return '$word';
  }
}
