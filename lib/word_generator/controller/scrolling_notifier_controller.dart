part of 'controller.dart';

class ScrollingNotifierController extends ChangeNotifier {
  bool _collapseContainer = false;
  bool get collapseContainer => _collapseContainer;

  double getSizedBoxHeight({
    required BuildContext context,
  }) {
    int listSize = context.watch<WordController>().previousWords.length;

    double navBarHeight = context.watch<NavigationController>().isBottomBar
        ? kBottomNavBarHeight
        : 0;
    double listHeight = (kWordHeight * listSize) + 20;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight / 2;
    double remainingHeight =
        screenHeight - containerHeight - listHeight - navBarHeight;

    return remainingHeight;
  }

  void handleScrollNotification(ScrollNotification notification,
      ScrollController scrollController, context) {
    final collapsePosition = scrollController.position.maxScrollExtent -
        MediaQuery.of(context).size.height / 4;

    final double currentPixels = notification.metrics.pixels;

    if (currentPixels <= collapsePosition && !collapseContainer) {
      _collapseContainer = true;
      print('collapse container: $collapseContainer');
      notifyListeners();
    } else if (currentPixels > collapsePosition && collapseContainer) {
      _collapseContainer = false;
      print('collapse container: $collapseContainer');
      notifyListeners();
    }
  }
}
