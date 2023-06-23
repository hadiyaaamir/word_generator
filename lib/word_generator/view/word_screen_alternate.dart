part of 'view.dart';

class WordScreenAlternate extends StatefulWidget {
  const WordScreenAlternate({super.key});

  @override
  State<WordScreenAlternate> createState() => _WordScreenAlternateState();
}

class _WordScreenAlternateState extends State<WordScreenAlternate> {
  final ScrollController _scrollController = ScrollController();
  bool collapseContainer = false;

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _goToBottomPage() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goToBottomPage();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    final collapsePosition = _scrollController.position.maxScrollExtent -
        MediaQuery.of(context).size.height / 4;

    final double currentPixels = notification.metrics.pixels;

    if (currentPixels <= collapsePosition && !collapseContainer) {
      setState(() => collapseContainer = true);
      print('collapse container: $collapseContainer');
    } else if (currentPixels > collapsePosition && collapseContainer) {
      setState(() => collapseContainer = false);
      print('collapse container: $collapseContainer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _handleScrollNotification(notification);
        return false;
      },
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverFillRemaining(),
              const WordsList(reverseList: true),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      if (!collapseContainer) ...[
                        const WordTile(),
                        const SizedBox(height: 10),
                        ButtonsRow(
                            scrollOnNext: true,
                            scrollController: _scrollController),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (collapseContainer)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Generate Word'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
