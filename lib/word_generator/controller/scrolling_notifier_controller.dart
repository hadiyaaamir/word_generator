part of 'controller.dart';

class ScrollingNotifierController extends ChangeNotifier {
  bool _collapseContainer = false;
  bool get collapseContainer => _collapseContainer;

  // set collapseContainer(bool collapse) {
  //   _collapseContainer = collapse;
  //   notifyListeners();
  // }

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
