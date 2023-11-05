import 'package:app_yes_no/config/theme/app_theme.dart';
import 'package:app_yes_no/presentation/providers/chat_provider.dart';
import 'package:app_yes_no/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => ChatProvider()),
      ],
      child: MaterialApp(
        title: "Yes No App",
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).themeData(),
        home: const ChatScreen(),
      ),
    );
  }
}
