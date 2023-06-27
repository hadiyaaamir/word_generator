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
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(_animationController);

    _sizeAnimation = Tween<double>(
      begin: 35.0,
      end: 10,
    ).animate(_animationController);

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: -55.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );
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

    var colorScheme = Theme.of(context).colorScheme;

    _colorAnimation = ColorTween(
      begin: colorScheme.onPrimary,
      end: colorScheme.primary,
    ).animate(_animationController);

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
          ],
        ),
      ),
      onDoubleTap: () {
        context.read<WordController>().toggleCurrentFavourite();
      },
    );
  }
}
