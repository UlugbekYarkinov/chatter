import 'package:chatter/screens/chat_screen.dart';
import 'package:chatter/screens/login_screen.dart';
import 'package:chatter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatter/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.lightBlue,
          elevation: 0.0,
        )
      ),
      routes: <String, Widget Function(BuildContext)> {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}