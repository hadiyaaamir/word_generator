part of 'view.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    WordController wordController = context.watch<WordController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LikeButton(),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            wordController.getNext();
          },
          child: const Text('Next Word'),
        ),
      ],
    );
  }
}
