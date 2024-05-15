import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_not_app/config/theme/app_theme.dart';
import 'package:yes_or_not_app/presentation/providers/chat_provider.dart';
import 'package:yes_or_not_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            ChatProvider();
          },
          // builder: (context, child) {
          //   return Text(context.watch<ChatProvider>().toString());
          // },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yes or Not App',
        theme: AppTheme(selectedColor: 2).theme(),
        home: Scaffold(
            // appBar: AppBar(
            //   title: const Text('Material App Bar'),
            // ),
            body: ChatScreen()),
      ),
    );
  }
}
