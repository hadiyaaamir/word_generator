part of 'view.dart';

class WordScreen extends StatelessWidget {
  WordScreen({super.key});

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
  Widget build(BuildContext context) {
    WordController wordController = context.watch<WordController>();
    wordController.wordListKey = _listKey;

    return CustomScrollView(
      controller: _scrollController,
      reverse: true,
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          expandedHeight: MediaQuery.of(context).size.height / 2,
          pinned: true,
          snap: true,
          floating: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final bool isCollapsed = constraints.maxHeight <=
                  kToolbarHeight + (MediaQuery.of(context).padding.top);

              return isCollapsed
                  ? Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: _scrollDown,
                        child: const Text('Generate Word'),
                      ),
                    )
                  : const FlexibleSpaceBar(
                      background: Column(
                        children: [
                          WordTile(),
                          SizedBox(height: 10),
                          ButtonsRow(),
                        ],
                      ),
                    );
            },
          ),
        ),

        WordsList(),

        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) {
        //       return SmallWordTile(word: wordController.previousWords[index]);
        //     },
        //     childCount: wordController.previousWords.length,
        //   ),
        // ),
      ],
    );
  }
}
