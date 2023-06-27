part of 'view.dart';

class WordTile extends StatefulWidget {
  const WordTile({super.key});

  @override
  State<WordTile> createState() => WordTileState();
}

class WordTileState extends State<WordTile>
    with SingleTickerProviderStateMixin {
  late Word oldWord;

  late AnimationController _animationController;

  late Animation<Color?> _colorAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    oldWord = context.read<WordController>().current;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_animationController);

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0,
    ).animate(_animationController);

    _sizeAnimation = Tween<double>(
      begin: 35.0,
      end: 8,
    ).animate(_animationController);

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: -100.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void slideOff() {
    _animationController.forward().then((_) {
      setState(() {
        oldWord = context.read<WordController>().current;
      });
      _animationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final WordController wordController = context.watch<WordController>();
    wordController.wordTileKey = widget.key as GlobalKey;

    Word word = wordController.current;
    // Word oldWord = wordController.previous;

    var colorScheme = Theme.of(context).colorScheme;

    print('old word: $oldWord, new word: $word');
    return GestureDetector(
      child: Card(
        color: colorScheme.primary,
        elevation: 3,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: AnimatedSizer(
                child: AnimatedScaleAndFade(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return FittedBox(
                        fit: BoxFit.contain,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.translate(
                              offset: Offset(0.0, _slideAnimation.value),
                              child: Opacity(
                                opacity: _opacityAnimation.value,
                                child: CurrentWord(
                                  word: oldWord,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: _colorAnimation.value,
                                        fontSize: _sizeAnimation.value,
                                      ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 1 - _opacityAnimation.value,
                              child: CurrentWord(
                                key: Key('${word.isSwitched}'),
                                word: word,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: colorScheme.onPrimary,
                                      fontSize: 35.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 0,
              child: SwapWordIconButton(),
            ),
            // IconButton(
            //   onPressed: () {
            //     slideOff();
            //     context.read<WordController>().getNext();
            //   },
            //   icon: Icon(
            //     Icons.move_up,
            //     color: colorScheme.onPrimary,
            //   ),
            // )
          ],
        ),
      ),
      onDoubleTap: () {
        context.read<WordController>().toggleCurrentFavourite();
      },
    );
  }
}
