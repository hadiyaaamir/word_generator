part of 'view.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({super.key});

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WordController wordController = context.watch<WordController>();
    wordController.wordListKey = _listKey;

    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      controller: _scrollController,
      reverse: true,
      slivers: [
        SliverAppBar(
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
                duration: 750,
                child: isCollapsed
                    ? Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: _scrollDown,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                            ),
                            child: const Text('Generate Word')),
                      )
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
        ),
        const WordsList(),
      ],
    );
  }
}
