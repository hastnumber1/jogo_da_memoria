import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jogo_da_memoria/controllers/game_controller.dart';
import 'package:jogo_da_memoria/pages/splash_page.dart';
import 'package:jogo_da_memoria/repositories/recordes_repository.dart';
import 'package:jogo_da_memoria/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  runApp(MultiProvider(
    providers: [
      Provider<RecordesRepository>(create: (_) => RecordesRepository()),
      ProxyProvider<RecordesRepository, GameController>(
        update: (_, repo, __) => GameController(recordesRepository: repo),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da Memória',
      debugShowCheckedModeBanner: false,
      theme: MemoriaTheme.theme,
      home: const SplashPage(),
    );
  }
}
