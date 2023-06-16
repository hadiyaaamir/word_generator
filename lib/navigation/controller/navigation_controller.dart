part of 'controller.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<AppPage> _pages = [
    AppPage.home(),
    AppPage.liked(),
  ];

  List<NavigationRailDestination> get destinations {
    List<NavigationRailDestination> list = [];

    for (AppPage page in _pages) {
      list.add(
        NavigationRailDestination(
          icon: Icon(page.icon),
          label: Text(page.label),
        ),
      );
    }

    return list;
  }

  Widget get currentPage {
    if (selectedIndex < _pages.length) {
      return _pages[selectedIndex].page;
    }
    return const Placeholder();
  }

  double _maxWidth = 0;
  set maxWidth(double maxWidth) {
    _maxWidth = maxWidth;
    notifyListeners();
  }

  bool get extended => _maxWidth >= 600;
}
