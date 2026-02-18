import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nation_identity_application/Pages/aspect_locked_app.dart';
import 'package:nation_identity_application/WidgetTree.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode
        .immersiveSticky, // Hides nav and status bars, but allows swipe to show temporarily
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nation Identity App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: AspectLockedApp(), backgroundColor: Colors.white),
    );
  }
}