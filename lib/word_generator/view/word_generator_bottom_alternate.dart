part of 'view.dart';

class WordGeneratorBottomAlternate extends StatelessWidget {
  const WordGeneratorBottomAlternate({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    bool collapseContainer =
        context.watch<ScrollingNotifierController>().collapseContainer;

    return AnimatedFader(
      child: collapseContainer
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GenerateWordButton(
                scrollController: scrollController,
                alignment: Alignment.bottomCenter,
                reverseScroll: true,
              ),
            )
          : const SizedBox(),
    );
  }
}
