part of 'controller.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  bool _isBottomBar = false;
  bool get isBottomBar => _isBottomBar;

  bool _isExtended = false;
  bool get isExtended => _isExtended;

  setNavBarType(double screenWidth) {
    _isBottomBar = screenWidth < 450;
    _isExtended = screenWidth >= 600;
    notifyListeners();
  }

  final List<AppPage> _pages = [
    AppPage.home(),
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
