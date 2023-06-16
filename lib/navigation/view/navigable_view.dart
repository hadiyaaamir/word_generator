part of 'view.dart';

class NavigableView extends StatelessWidget {
  const NavigableView({
    super.key,
    this.extended = false,
    this.bottomBar = false,
  });

  final bool extended;
  final bool bottomBar;

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController =
        context.watch<NavigationController>();
    return bottomBar
        ? Column(
            children: [
              Expanded(
                child: navigationController.currentPage,
              ),
              const MyNavigationBottomBar(),
            ],
          )
        : Row(
            children: [
              SafeArea(
                child: MyNavigationRail(extended: extended),
              ),
              Expanded(
                child: navigationController.currentPage,
              ),
            ],
          );
  }
}
