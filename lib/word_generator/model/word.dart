part of 'model.dart';

@immutable
class Word {
  const Word({
    required this.word,
    this.isFavourite = false,
    this.isSwitched = false,
  });

  final WordPair word;
  final bool isFavourite;
  final bool isSwitched;

  Word copyWith({WordPair? word, bool? isFavourite, bool? isSwitched}) => Word(
        word: word ?? this.word,
        isFavourite: isFavourite ?? this.isFavourite,
        isSwitched: isSwitched ?? this.isSwitched,
      );

  Word toggleFavourite() => copyWith(isFavourite: !isFavourite);

  Word swapWords() => copyWith(
        word: WordPair(word.second, word.first),
        isSwitched: !isSwitched,
        isFavourite: false,
      );

  @override
  String toString() {
    return word.asLowerCase;
  }
}
