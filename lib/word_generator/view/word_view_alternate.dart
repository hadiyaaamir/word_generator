part of 'view.dart';

class WordViewAlternate extends StatefulWidget {
  const WordViewAlternate({super.key});

  @override
  State<WordViewAlternate> createState() => _WordViewAlternateState();
}

class _WordViewAlternateState extends State<WordViewAlternate> {
  final ScrollController _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    bool collapseContainer =
        context.watch<ScrollingNotifierController>().collapseContainer;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        context
            .read<ScrollingNotifierController>()
            .handleScrollNotification(notification, _scrollController, context);

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
                  child: AnimatedFadeAndSize(
                    duration: 750,
                    child: !collapseContainer
                        ? Column(
                            children: [
                              const WordTile(),
                              const SizedBox(height: 10),
                              ButtonsRow(
                                  scrollOnNext: true,
                                  scrollController: _scrollController),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
          AnimatedFadeAndSize(
            duration: 900,
            child: collapseContainer
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GenerateWordButton(
                      scrollController: _scrollController,
                      alignment: Alignment.bottomCenter,
                      reverseScroll: true,
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
