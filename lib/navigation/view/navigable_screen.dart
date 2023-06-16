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
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: MyNavigationRail(
                  extended: constraints.maxWidth >= 600,
                ),
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
