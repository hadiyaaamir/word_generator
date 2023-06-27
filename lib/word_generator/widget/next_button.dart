part of 'widget.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.scrollOnNext,
    required this.scrollController,
  });

  final bool scrollOnNext;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    WordController wordController = context.watch<WordController>();
    return ElevatedButton(
      onPressed: () {
        wordController.getNext();
        if (scrollOnNext && scrollController != null) {
          scrollController!.jumpTo(scrollController!.position.maxScrollExtent);
        }
      },
      child: const Text('Next Word'),
    );
  }
}
