part of 'view.dart';

class WordScreenAlternate extends StatefulWidget {
  const WordScreenAlternate({super.key});

  @override
  State<WordScreenAlternate> createState() => _WordScreenAlternateState();
}

class _WordScreenAlternateState extends State<WordScreenAlternate> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScrollingNotifierController(),
      child: const WordViewAlternate(),
    );
  }
}
