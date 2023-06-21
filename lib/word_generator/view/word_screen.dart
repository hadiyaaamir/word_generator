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

  @override
  Widget build(BuildContext context) {
    WordController wordController = context.watch<WordController>();

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
                  kToolbarHeight + (MediaQuery.of(context).padding.top + 100);

              return isCollapsed
                  ? Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: _scrollDown,
                        child: const Text('Generate Word'),
                      ),
                    )
                  : Column(
                      children: [
                        const WordTile(),
                        const SizedBox(height: 10),
                        ButtonsRow(),
                      ],
                    );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return SmallWordTile(word: wordController.previousWords[index]);
            },
            childCount: wordController.previousWords.length,
          ),
        ),
      ],
    );

    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Expanded(flex: 4, child: WordsList()),
    //       const WordTile(),
    //       const SizedBox(height: 10),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const LikeButton(),
    //           const SizedBox(width: 10),
    //           ElevatedButton(
    //             onPressed: () {
    //               wordController.getNext();
    //             },
    //             child: const Text('Next Word'),
    //           ),
    //         ],
    //       ),
    //       const Spacer(flex: 3),
    //     ],
    //   ),
    // );
  }
}
