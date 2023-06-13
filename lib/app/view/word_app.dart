part of 'view.dart';

class WordApp extends StatelessWidget {
  const WordApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordController(),
      child: MaterialApp(
        title: 'Word Generator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const WordScreen(),
      ),
    );
  }
}
