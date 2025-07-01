import 'package:cropssafe/components/authentication_button.dart';
import 'package:cropssafe/components/curve.dart';
import 'package:cropssafe/components/google_button.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/inner_screens/forgot_password.dart';
import 'package:cropssafe/inner_screens/loading_manager.dart';
import 'package:cropssafe/screens/landingpage.dart';
import 'package:cropssafe/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/btm_bar.dart';
import '../consts/firebase_consts.dart';
import '../consts/global_methods.dart';
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  var email = '';
  var password = '';
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  bool _isLoading = false;

  void _submitFormOnLogin() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomBarScreen()));
    // if (isValid) {
    //   _formKey.currentState!.save();
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   try {
    //     await authInstance.signInWithEmailAndPassword(
    //         email: _emailTextController.text.toLowerCase().trim(),
    //         password: _passTextController.text.trim());
    //     Fluttertoast.showToast(
    //       msg: "Successfully logged in ",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.grey.shade600,
    //       textColor: Colors.white,
    //       fontSize: 16.0,
    //     );
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) => BottomBarScreen()));
    //     print('Succefully registered');
    //   } on FirebaseException catch (error) {
    //     GlobalMethods.errorDialog(
    //         subtitle: '${error.message}', context: context);
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   } catch (error) {
    //     GlobalMethods.errorDialog(subtitle: '$error', context: context);
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   } finally {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Image.asset(
                            'images/logo1.png',
                            fit: BoxFit.cover,
                            height: size.height * 0.1,
                            width: size.height * 0.1,
                          ),
                          Text(
                            'Crops Safe',
                            style: GoogleFonts.sahitya(
                                fontSize: 50, color: kDarkGreenColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.35,
                      color: Colors.white70.withOpacity(0.35),
                    )
                  ],
                ),
              ),
            ),

            // Back Button
            Positioned(
              top: 16,
              left: 16,
              child: CircleAvatar(
                backgroundColor: kDarkGreenColor,
                radius: 22.0,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ),

            // Form Container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.7,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  color: kSpiritedGreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, -6),
                    )
                  ],
                ),
                child: LoadingManager(
                  isLoading: _isLoading,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Welcome Back',
                                style: GoogleFonts.sahitya(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: kDarkGreenColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Login to your account',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildInputField(
                                label: 'Email',
                                controller: _emailTextController,
                                icon: Icons.email,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains('@')) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(_passFocusNode),
                              ),
                              const SizedBox(height: 16),
                              _buildInputField(
                                label: 'Password',
                                controller: _passTextController,
                                icon: Icons.lock,
                                focusNode: _passFocusNode,
                                obscureText: _obscureText,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kDarkGreenColor,
                                  ),
                                  onPressed: () => setState(
                                      () => _obscureText = !_obscureText),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.length < 6 ||
                                      !RegExp(r'[A-Z]').hasMatch(value) ||
                                      !RegExp(r'[0-9]').hasMatch(value)) {
                                    return 'Enter a strong password';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (_) => _submitFormOnLogin(),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ForgetPasswordScreen()),
                                  ),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: kDarkGreenColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Buttons
                        AuthenticationButton(
                          label: 'Log In',
                          onPressed: _submitFormOnLogin,
                        ),
                        const SizedBox(height: 12),
                        GoogleButton(),
                        const SizedBox(height: 20),

                        // Signup link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, SignupScreen.id),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    void Function(String)? onFieldSubmitted,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      style: GoogleFonts.poppins(
        color: kDarkGreenColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: kGinColor,
        prefixIcon: Icon(icon, color: kDarkGreenColor),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
