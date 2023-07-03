part of 'model.dart';

@immutable
class Word {
  const Word({
    required this.word,
    this.isFavourite = false,
    this.isSwapped = false,
  });

  final WordPair word;
  final bool isFavourite;
  final bool isSwapped;

  Word copyWith({WordPair? word, bool? isFavourite, bool? isSwapped}) => Word(
        word: word ?? this.word,
        isFavourite: isFavourite ?? this.isFavourite,
        isSwapped: isSwapped ?? this.isSwapped,
      );

  Word toggleFavourite() => copyWith(isFavourite: !isFavourite);

  Word swapWords() => copyWith(
        word: WordPair(word.second, word.first),
        isSwapped: !isSwapped,
        isFavourite: false,
      );

  @override
  String toString() {
    return word.asLowerCase;
  }
}
