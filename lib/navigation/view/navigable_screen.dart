part of 'view.dart';

class NavigableScreen extends StatefulWidget {
  const NavigableScreen({super.key});

  @override
  State<NavigableScreen> createState() => _NavigableScreenState();
}

class _NavigableScreenState extends State<NavigableScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          body: NavigableView(
            extended: constraints.maxWidth >= 600,
            bottomBar: constraints.maxWidth < 450,
          ),
        );
      },
    );
  }
}
