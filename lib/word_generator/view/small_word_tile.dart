part of 'view.dart';

class SmallWordTile extends StatelessWidget {
  const SmallWordTile({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kWordHeight,
      child: Center(
        child: TextButton.icon(
          icon: word.isFavourite
              ? Icon(
                  key: ValueKey('${word.isFavourite}'),
                  Icons.favorite,
                  size: 10)
              : Container(key: ValueKey('${word.isFavourite}')),
          label: Text(word.toString()),
          onPressed: () {
            context.read<WordController>().toggleFavourite(word);
          },
        ),
      ),
    );
  }
}
