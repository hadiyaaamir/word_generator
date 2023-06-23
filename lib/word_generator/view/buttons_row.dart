part of 'view.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
    this.scrollOnNext = false,
    this.scrollController,
  });

  final bool scrollOnNext;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LikeButton(),
        const SizedBox(width: 10),
        NextButton(
          scrollOnNext: scrollOnNext,
          scrollController: scrollController,
        ),
      ],
    );
  }
}
