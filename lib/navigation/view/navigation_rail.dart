part of 'view.dart';

class MyNavigationRail extends StatefulWidget {
  const MyNavigationRail({super.key});

  @override
  State<MyNavigationRail> createState() => _MyNavigationRailState();
}

class _MyNavigationRailState extends State<MyNavigationRail> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    NavigationController navigationController =
        context.watch<NavigationController>();

    return NavigationRail(
      extended: navigationController.extended,
      selectedIndex: navigationController.selectedIndex,
      backgroundColor: colorScheme.primaryContainer,
      indicatorColor: colorScheme.primary,
      selectedIconTheme: IconThemeData(color: colorScheme.onPrimary),
      destinations: navigationController.destinations,
      onDestinationSelected: (int index) =>
          context.read<NavigationController>().selectedIndex = index,
    );
  }
}
