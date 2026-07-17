import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'profile_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;
  bool flag= false;
  final supabase = Supabase.instance.client;

  loginFunction() async{
     setState(() {
       flag = true;
     });
     try{

       final result = await supabase.auth.signInWithPassword(
         email: emailController.text,
         password: passwordController.text,
       );
        if(result.user!=null && result.session!=null){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Login Successfully!"),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.green,
              ));
          setState(() {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen()) ,
                (context)=>false);
          });
        }
     }
     catch(e){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text(e.toString()),
             duration: Duration(seconds: 15),
             backgroundColor: Colors.red,
           ));

     } finally{flag=flag;}
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: const Color(0xff16A34A),
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xffF9FAFB),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 18,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xff16A34A),
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff16A34A),
                          Color(0xff059669),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(.25),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.lock_open_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Login to continue your journey.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {

                      if (value == null || value.trim().isEmpty) {
                        return "Enter your email";
                      }

                      if (!RegExp(
                        r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
                      ).hasMatch(value.trim())) {
                        return "Invalid email";
                      }

                      return null;
                    },
                    decoration: inputDecoration(
                      hint: "Email Address",
                      icon: Icons.email_outlined,
                    ),
                  ),

                  const SizedBox(height: 14),

                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordHidden,
                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return "Enter password";
                      }

                      return null;
                    },
                    decoration: inputDecoration(
                      hint: "Password",
                      icon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                        icon: Icon(
                          isPasswordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Forgot Password
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff059669),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                 flag? Center(child: CircularProgressIndicator(color: Colors.green,),) :
                 SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loginFunction();
                          });
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff16A34A),
                              Color(0xff059669),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey.shade400),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey.shade400),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [

                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Google Login
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Facebook Login
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Color(0xff1877F2),
                            size: 22,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Microsoft Login
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const FaIcon(
                            FontAwesomeIcons.microsoft,
                            color: Color(0xff0078D4),
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SignupScreen(),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xff059669),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "By continuing, you agree to our\nTerms & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}