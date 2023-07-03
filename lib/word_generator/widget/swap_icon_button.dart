part of 'widget.dart';

class SwapWordIconButton extends StatelessWidget {
  const SwapWordIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    Word word = context.watch<WordController>().current;
    var colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: word.isSwapped
          ? null
          : () => context.read<WordController>().swapWords(),
      icon: Icon(
        Icons.swap_horiz,
        size: 17,
        color: word.isSwapped ? colorScheme.outline : colorScheme.onPrimary,
      ),
    );
  }
}
