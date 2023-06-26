part of 'view.dart';

class NavigableView extends StatefulWidget {
  const NavigableView({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<NavigableView> createState() => _NavigableViewState();
}

class _NavigableViewState extends State<NavigableView> {
  @override
  Widget build(BuildContext context) {
    NavigationController navigationController =
        context.watch<NavigationController>();

    return navigationController.isBottomBar
        ? Column(
            children: [
              Expanded(
                child: AnimatedFader(
                  child: navigationController.currentPage,
                ),
              ),
              const NavigationBottomBar(),
            ],
          )
        : Row(
            children: [
              SafeArea(
                child: CustomNavigationRail(
                  extended: navigationController.isExtended,
                ),
              ),
              Expanded(
                child: AnimatedFader(
                  child: navigationController.currentPage,
                ),
              ),
            ],
          );
  }
}
