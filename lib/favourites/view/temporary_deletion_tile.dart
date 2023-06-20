part of 'view.dart';

class TemporaryDeletionTile extends StatelessWidget {
  const TemporaryDeletionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, right: 35, left: 35),
      child: Card(
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        ),
      ),
    );
  }
}
