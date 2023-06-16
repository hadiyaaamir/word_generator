part of 'view.dart';

class WordScreen extends StatelessWidget {
  const WordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WordController wordController = context.watch<WordController>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: WordsList(),
            flex: 4,
          ),
          WordTile(word: wordController.current),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LikeButton(),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  wordController.getNext();
                },
                child: const Text('Next Word'),
              ),
            ],
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
