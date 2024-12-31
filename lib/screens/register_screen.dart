import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFF5F5F5), // Soft light gray for a clean background
      appBar: AppBar(
          backgroundColor: Color(0xFF00BFA6), // Teal color for the AppBar
          title: Text(
            "Register",
            style: GoogleFonts.montserrat(
                fontSize: 24, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _buildTitle(),
                SizedBox(height: 30),
                _buildTextField(
                  context,
                  controller: usernameController,
                  label: "Username",
                  hint: "Enter your username",
                  icon: Icons.person,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  context,
                  controller: emailController,
                  label: "Email",
                  hint: "Enter your email",
                  icon: Icons.email,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  context,
                  controller: passwordController,
                  label: "Password",
                  hint: "Enter your password",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  context,
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  hint: "Confirm your password",
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                SizedBox(height: 30),
                _buildRegisterButton(context),
                SizedBox(height: 20),
                _buildAlreadyHaveAccount(context),
              ],
            )),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Column(
        children: [
          Text(
            "Create Account",
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00BFA6),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Join us and start managing your expenses efficiently!",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.teal.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Color(0xFF00BFA6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF00BFA6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF00BFA6), width: 2),
        ),
      ),
      style: GoogleFonts.montserrat(fontSize: 16),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle registration logic
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
          backgroundColor: Color(0xFF00BFA6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Color(0xFF00BFA6), Color(0xFF5E35B1)],
          ).createShader(Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
          child: Text(
            "Register",
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlreadyHaveAccount(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: Text(
          "Already have an account? Log in",
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5E35B1),
          ),
        ),
      ),
    );
  }
}
