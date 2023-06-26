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
            // anchor: 0.4,
            controller: _scrollController,
            slivers: [
              // const SliverFillRemaining(),
              const WordsList(reverseList: true),
              WordGeneratorAlternate(scrollController: _scrollController),
            ],
          ),
          WordGeneratorBottomAlternate(scrollController: _scrollController),
        ],
      ),
    );
  }
}
