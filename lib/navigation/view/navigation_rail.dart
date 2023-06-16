part of 'view.dart';

class MyNavigationRail extends StatefulWidget {
  const MyNavigationRail({super.key, this.extended = false});

  final bool extended;

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
      extended: widget.extended,
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
