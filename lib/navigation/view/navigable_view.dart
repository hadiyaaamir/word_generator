part of 'view.dart';

class NavigableView extends StatelessWidget {
  const NavigableView({
    super.key,
  });

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
