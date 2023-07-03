part of 'view.dart';

class WordGenerator extends StatelessWidget {
  const WordGenerator({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SliverAppBar(
      backgroundColor: colorScheme.surfaceVariant,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      pinned: true,
      snap: true,
      floating: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isCollapsed = constraints.maxHeight <=
              kToolbarHeight +
                  (MediaQuery.of(context).padding.top) +
                  (MediaQuery.of(context).size.height / 6);

          return AnimatedFadeAndSize(
            duration: const Duration(milliseconds: 750),
            child: isCollapsed
                ? GenerateWordButton(scrollController: _scrollController)
                : const FlexibleSpaceBar(
                    background: Column(
                      children: [
                        WordTile(),
                        SizedBox(height: 10),
                        ButtonsRow(),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
