part of 'view.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({
    super.key,
  });

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    NavigationController navigationController =
        context.watch<NavigationController>();

    return SizedBox(
        height: kBottomNavBarHeight,
        child: BottomNavigationBar(
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
        ));
  }
}
