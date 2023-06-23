part of 'widgets.dart';

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
          scrollController!.animateTo(
            scrollController!.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      child: const Text('Next Word'),
    );
  }
}
