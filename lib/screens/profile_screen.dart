import 'package:flutter/material.dart';
import 'package:flutter_authorization_app/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {
  final supabase = Supabase.instance.client;

  String name = "";
  String email = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) return;

      final data = await supabase
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      setState(() {
        name = data['name'];
        email = data['email'];
        isLoading = false;
      });
    }
    catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const LoginScreen(),
      ),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
        const Color(0xffF4F6F8),
        body: isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color:
            Color(0xff16A34A),
          ),
        ) : SafeArea(

          child: Column(
            children: [
            Container(
            height: 150,
            width:
            double.infinity,
            padding:
            const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 20,
            ),
            decoration:
            const BoxDecoration(
              gradient:
              LinearGradient(
                colors: [
                  Color(0xff16A34A),
                  Color(0xff059669),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text( "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: const Color(0xff16A34A),
                    child: Text(
                      name.isNotEmpty
                          ? name[0]
                          .toUpperCase()
                          : "?",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text( email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      profileTile(
                        icon: Icons.person_outline,
                        title: "Account Information",
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      profileTile(
                        icon: Icons.lock_outline,
                        title: "Change Password",
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      profileTile(
                        icon: Icons.notifications_none,
                        title: "Notifications",
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      profileTile(
                        icon: Icons.security_outlined,
                        title: "Privacy & Security",
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      profileTile(
                        icon: Icons.info_outline,
                        title: "About App",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),

                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: logout,
                    icon: const Icon(
                      Icons.logout,
                    ),
                    label: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    bottomIcon(
                      Icons.home_outlined,
                      false,
                    ),
                    bottomIcon(
                      Icons.dashboard_outlined,
                      false,
                    ),
                    bottomIcon(
                      Icons.person,
                      true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget profileTile({

    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {

    return InkWell(
      onTap: onTap,
      borderRadius:
      BorderRadius.circular(18),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: const Color(0xff16A34A).withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xff16A34A),
                size: 22,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomIcon(
      IconData icon,
      bool selected,
      ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xff16A34A)
            .withOpacity(0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Icon(
        icon,
        size: 28,
        color: selected
            ? const Color(0xff16A34A)
            : Colors.grey,
      ),
    );
  }
}