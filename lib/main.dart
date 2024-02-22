import 'package:app_mensajes/config/chat/chat_screem.dart';
import 'package:app_mensajes/config/theme/app_theme.dart';
import 'package:app_mensajes/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
          theme: Apptheme(selectedColor: 3).theme(),
          debugShowCheckedModeBanner: false,
          title: 'Yes No App',
          home: const ChatScreen()),
    );
  }
}
