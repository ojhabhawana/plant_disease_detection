import 'package:cropssafe/consts/alertbox.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/inner_screens/aboutus.dart';
import 'package:cropssafe/inner_screens/privacy.dart';
import 'package:cropssafe/inner_screens/terms_and_conditions.dart';
import 'package:cropssafe/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../inner_screens/text_widget.dart';

class Myprofile extends StatefulWidget {
  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  String? _email = "test@gmail.com";
  String? _name = "Bhawana";

  Widget buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 0,
      color: kMain.withValues(alpha: .4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: kMain),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFoamColor,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            color: kMain,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Crops Safe',
                    style: GoogleFonts.sahitya(fontSize: 35, color: kFoamColor),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=47'), // <- Replace with your actual image url
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: _name ?? 'Bhawana',
                          color: Colors.white,
                          textSize: 18,
                        ),
                        const SizedBox(height: 4),
                        TextWidget(
                          text: _email ?? 'xyz@gmail.com',
                          color: Colors.white70,
                          textSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kFoamColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildListTile(
                    icon: Icons.description,
                    title: 'Terms and Conditions',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => termsscreen()),
                      );
                    },
                  ),
                  buildListTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => PrivacyPage()),
                      );
                    },
                  ),
                  buildListTile(
                    icon: Icons.info_outline,
                    title: 'About Us',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => AboutUsPage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kMain.withValues(alpha: .4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      showLogoutDialog(
                        context,
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.logout, color: kDarkGreenColor),
                    label: Text(
                      "Logout",
                      style: TextStyle(color: kDarkGreenColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
