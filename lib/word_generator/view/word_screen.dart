part of 'view.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({super.key});

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  final ScrollController _scrollController = ScrollController();

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

    return CustomScrollView(
      controller: _scrollController,
      reverse: true,
      slivers: [
        WordGenerator(scrollController: _scrollController),
        const WordsList(),
      ],
    );
  }
}
