import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final result = Supabase.instance.client;
  loading()async{
    await Future.delayed(Duration(seconds: 5));
    if(result.auth.currentSession==null){
      setState(() {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(
                builder: (context)=>LoginScreen()),
            (context)=>false);
      });
    }
    else{
      setState(() {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(
                builder: (context)=>ProfileScreen()),
            (context)=>false);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff16A34A),
                Color(0xff059669),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.lock_person_rounded,
                  color: Color(0xff16A34A),
                  size: 60,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Flutter Auth App",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Secure Login with Supabase",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 60),

              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
