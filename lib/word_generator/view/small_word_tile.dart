part of 'view.dart';

class SmallWordTile extends StatelessWidget {
  const SmallWordTile({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: word.isFav
              ? const Icon(key: Key("favourite"), Icons.favorite, size: 10)
              : Container(key: const Key("not favourite")),
        ),
        label: Text(word.toString()),
        onPressed: () {
          context.read<WordController>().toggleFavourite(word);
        },
      ),
    );
  }
}
