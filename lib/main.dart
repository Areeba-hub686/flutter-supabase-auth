import 'package:flutter/material.dart';
import 'package:flutter_authorization_app/screens/login_screen.dart';
import 'package:flutter_authorization_app/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await Supabase.initialize(url: 'https://xiwgivjrpqkawotaemwu.supabase.co',
  anonKey: 'sb_publishable_y3Lq5tBPUk9DcbW3l9SG2g_PkmClF0A');
  runApp(Routing());
}

class Routing extends StatelessWidget {
  const Routing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
