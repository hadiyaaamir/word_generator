part of 'view.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    WordController wordController = context.watch<WordController>();
    bool isFav = wordController.isCurrentFavourite;

    return ElevatedButton.icon(
        onPressed: () {
          context.read<WordController>().toggleCurrentFavourite();
        },
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: isFav
              ? const Icon(Icons.favorite, key: Key('favourite icon'))
              : const Icon(Icons.favorite_border, key: Key('unfavourite icon')),
        ),
        label: const Text('Like'));
  }
}
