part of 'model.dart';

class AppPage {
  AppPage({
    required this.page,
    required this.label,
    required this.icon,
  });

  final Widget page;
  final String label;
  final IconData icon;

  factory AppPage.home() =>
      AppPage(page: const WordScreen(), label: 'Home', icon: Icons.home);

  factory AppPage.home2() => AppPage(
      page: const WordScreenAlternate(), label: 'Home 2', icon: Icons.home);

  factory AppPage.liked() => AppPage(
      page: const FavouritesScreen(), label: 'Liked', icon: Icons.favorite);
}
