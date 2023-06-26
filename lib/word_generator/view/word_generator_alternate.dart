part of 'view.dart';

class WordGeneratorAlternate extends StatelessWidget {
  const WordGeneratorAlternate({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    bool collapseContainer =
        context.watch<ScrollingNotifierController>().collapseContainer;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: AnimatedFadeAndSize(
          duration: const Duration(milliseconds: 750),
          child: !collapseContainer
              ? Column(
                  children: [
                    const WordTile(),
                    const SizedBox(height: 10),
                    ButtonsRow(
                      scrollOnNext: true,
                      scrollController: scrollController,
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
