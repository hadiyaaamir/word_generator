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
    AppPage.home2(),
    AppPage.liked(),
  ];
  List<AppPage> get pages => _pages;

  Widget get currentPage {
    if (selectedIndex < _pages.length) {
      return _pages[selectedIndex].page;
    }
    return const Placeholder();
  }
}
