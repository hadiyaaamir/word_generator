part of 'view.dart';

class WordApp extends StatelessWidget {
  const WordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WordController()),
        ChangeNotifierProvider(create: (context) => NavigationController()),
      ],
      child: MaterialApp(
        title: 'Word Generator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kSeedColor),
          useMaterial3: true,
        ),
        home: const NavigableScreen(),
      ),
    );
  }
}
