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

  // double _getRemainingHeight() {
  //   int listSize = context.watch<WordController>().previousWords.length;

  //   double navBarHeight = context.watch<NavigationController>().isBottomBar
  //       ? kBottomNavBarHeight
  //       : 0;
  //   double listHeight = (kWordHeight * listSize) + 20;
  //   double screenHeight = MediaQuery.of(context).size.height;
  //   double containerHeight = screenHeight / 2;
  //   double remainingHeight =
  //       screenHeight - containerHeight - listHeight - navBarHeight;

  //   return remainingHeight;
  // }

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
    double sizedBoxHeight = context
        .read<ScrollingNotifierController>()
        .getSizedBoxHeight(context: context);

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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: sizedBoxHeight > 0 ? sizedBoxHeight : 0,
                ),
              ),
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
