part of 'view.dart';

class MyNavigationBottomBar extends StatefulWidget {
  const MyNavigationBottomBar({
    super.key,
  });

  @override
  State<MyNavigationBottomBar> createState() => _MyNavigationBottomBarState();
}

class _MyNavigationBottomBarState extends State<MyNavigationBottomBar> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    NavigationController navigationController =
        context.watch<NavigationController>();

    return BottomNavigationBar(
      backgroundColor: colorScheme.onInverseSurface,
      items: [
        for (AppPage page in navigationController.pages)
          BottomNavigationBarItem(
            icon: Icon(page.icon),
            label: page.label,
          ),
      ],
      currentIndex: navigationController.selectedIndex,
      onTap: (index) =>
          context.read<NavigationController>().selectedIndex = index,
    );
  }
}
