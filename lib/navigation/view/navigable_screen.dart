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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context
              .read<NavigationController>()
              .setNavBarType(constraints.maxWidth);
        });
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          body: const NavigableView(),
        );
      },
    );
  }
}
