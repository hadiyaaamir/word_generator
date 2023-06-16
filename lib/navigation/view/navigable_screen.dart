part of 'view.dart';

class NavigableScreen extends StatefulWidget {
  const NavigableScreen({super.key});

  @override
  State<NavigableScreen> createState() => _NavigableScreenState();
}

class _NavigableScreenState extends State<NavigableScreen> {
  @override
  Widget build(BuildContext context) {
    NavigationController navigationController =
        context.watch<NavigationController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        context.read<NavigationController>().maxWidth = constraints.maxWidth;
        return Scaffold(
          body: Row(
            children: [
              const SafeArea(
                child: MyNavigationRail(),
              ),
              Expanded(
                child: navigationController.currentPage,
              ),
            ],
          ),
        );
      },
    );
  }
}
