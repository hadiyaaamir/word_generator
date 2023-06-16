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

  factory AppPage.liked() =>
      AppPage(page: const Placeholder(), label: 'Liked', icon: Icons.favorite);
}
