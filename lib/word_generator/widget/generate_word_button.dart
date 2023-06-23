part of 'widget.dart';

class GenerateWordButton extends StatelessWidget {
  const GenerateWordButton({
    super.key,
    required this.scrollController,
    this.alignment = Alignment.center,
    this.reverseScroll = false,
  });

  final ScrollController scrollController;
  final Alignment alignment;
  final bool reverseScroll;

  void _scrollDown() {
    double edgePosition = reverseScroll
        ? scrollController.position.maxScrollExtent
        : scrollController.position.minScrollExtent;

    scrollController.animateTo(
      edgePosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: alignment,
      child: ElevatedButton(
          onPressed: _scrollDown,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          child: const Text('Generate Word')),
    );
  }
}
