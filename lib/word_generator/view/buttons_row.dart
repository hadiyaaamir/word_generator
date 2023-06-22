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
    WordController wordController = context.watch<WordController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LikeButton(),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            wordController.getNext();
            if (scrollOnNext && scrollController != null) {
              scrollController!.animateTo(
                scrollController!.position.maxScrollExtent,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
              );
            }
          },
          child: const Text('Next Word'),
        ),
      ],
    );
  }
}
