part of 'view.dart';

class SmallWordTile extends StatelessWidget {
  const SmallWordTile({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        icon: word.isFav ? const Icon(Icons.favorite, size: 10) : Container(),
        label: Text(word.toString()),
        onPressed: () {
          context.read<WordController>().toggleFavourite(word);
        },
      ),
    );
  }
}
